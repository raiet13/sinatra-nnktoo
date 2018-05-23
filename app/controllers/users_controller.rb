
class UsersController < ApplicationController

  ## Sign Up Views ##

  get '/signup' do
    # puts "Get Sign Up Route"
    @message = session[:error_message]
    if logged_in?
      # puts "User Already Logged In"
      redirect to "/users/#{current_user.slug}"
    else
      # puts "Allow Sign Up"
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    # puts "Sign Up Params = #{params}"
    user = User.new(username: params[:username], password: params[:password])
		if user.save
      # puts "Saved user"
      session[:user_id] = user.id
      session[:error_message] = ""
      redirect to "/users/#{user.slug}"
		else
      # puts "FAILURE TO SAVE USER"
      session[:error_message] = "Something went wrong during sign up, please try again."
			redirect to "/signup"
		end
  end


  ## Log In Views ##

  get '/login' do
    # puts "Get Login Route"
    @message = session[:error_message]
    if logged_in?
      # puts "User Already Logged In"
      redirect to "/users/#{current_user.slug}"
    else
      # puts "Allow Log In"
      erb :'/users/login'
    end
  end

  post '/login' do
    # puts "Log In Params = #{params}"
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      # puts "User Successfully logged in"
      session[:user_id] = user.id
      session[:error_message] = ""
      redirect to "/users/#{user.slug}"
    else
      # puts "FAILURE TO FIND USER"
      session[:error_message] = "Something went wrong during log in, please try again."
      redirect to "/login"
    end
  end

  get '/logout' do
    # puts "Log Out Route"
    redirect_if_not_logged_in
    session.clear
    # puts "Allow Log Out"
    redirect to "/"
  end


  ## Specific User Views ##


  get '/users/:slug' do
    puts "User Show Route"
    redirect_if_not_logged_in
    @user = User.find_by_slug(params[:slug])
    puts "User = #{@user}"
    @session = session
    erb :'/users/show_user'
  end

  get '/users/:slug/edit' do
    puts "User Edit Route"
    redirect_if_not_logged_in
    @user = User.find_by_slug(params[:slug])
    erb :'/users/edit_user'
  end

  post '/users/:slug' do
    puts "Edit Params = #{params}"
    @user = User.find_by_slug(params[:slug])
    # data = params["landmark"]
    # @user.update(name: data[:name], year_completed: data[:year_completed])
    redirect to "/users/#{@user.slug}"
  end

end


# rake db:migrate SINATRA_ENV=test
