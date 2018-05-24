
class UsersController < ApplicationController

  ## Sign Up Views ##

  get '/signup' do
    @message = session[:error_message]
    if logged_in?
      redirect to "/users/#{current_user.slug}"
    else
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    user = User.new(username: params[:username], password: params[:password])
		if user.save
      session[:user_id] = user.id
      session[:error_message] = ""
      redirect to "/users/#{user.slug}"
		else
      session[:error_message] = "Something went wrong during sign up, please try again."
			redirect to "/signup"
		end
  end


  ## Log In Views ##

  get '/login' do
    @message = session[:error_message]
    if logged_in?
      redirect to "/users/#{current_user.slug}"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:error_message] = ""
      redirect to "/users/#{user.slug}"
    else
      session[:error_message] = "Something went wrong during log in, please try again."
      redirect to "/login"
    end
  end

  get '/logout' do
    redirect_if_not_logged_in
    session.clear
    redirect to "/"
  end


  ## Specific User Views ##

  get '/users' do
    redirect_if_not_logged_in
    @users = User.all
    erb :'/users/user_index'
  end

  get '/users/:slug' do
    redirect_if_not_logged_in
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show_user'
  end

end
