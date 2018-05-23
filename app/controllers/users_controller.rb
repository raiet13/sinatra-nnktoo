
class UsersController < ApplicationController

  ## Sign Up Views ##

  get '/signup' do
    puts "Get Sign Up Route"
    if logged_in?
      puts "User Already Logged In"
      redirect to "/users/#{current_user.slug}"
    else
      puts "Allow Sign Up"
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    puts "Sign Up Params = #{params}"
    user = User.new(username: params[:username], email: params[:email], password: params[:password])
		if user.save
      puts "Saved user"
      session[:user_id] = user.id
      redirect to "/users/#{user.slug}"
		else
      puts "FAILURE TO SAVE USER"
			redirect to "/signup"
		end
  end


  ## Log In Views ##

  get '/login' do
    puts "Get Login Route"
    if logged_in?
      puts "User Already Logged In"
      redirect to "/users/#{current_user.slug}"
    else
      puts "Allow Log In"
      erb :'/users/login'
    end
  end

  post '/login' do
    # puts "Post Login Route"
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      # puts "User Successfully logged in"
      session[:user_id] = user.id
      redirect to "/users/#{user.slug}"
    else
      # puts "FAILURE TO FIND USER"
      redirect to "/login"
    end
  end

  get '/logout' do
    puts "Log Out Route"
    # redirect_if_not_logged_in
    # session.clear
    if logged_in?
      puts "Allow Log Out"
      session.clear
    else
      puts "User Not Logged In"
    end
    redirect to "/login"
  end

  ## Specific User Views ##

  get '/users/:slug' do
    puts "User Show Route"
    redirect_if_not_logged_in
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show_user'
  end

end
