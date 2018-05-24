require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "evermore"
  end

  # Main Index Page #
  get '/' do
    session[:error_message] = ""
    erb :index
  end


  ## Helpers ##

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      if logged_in?
        User.find(session[:user_id])
      end
    end

    def redirect_if_not_logged_in
      if !logged_in?
        session[:error_message] = "You need to be logged in to do that."
        redirect to "/login"
      end
    end

  end

end
