require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "evermore"
  end

  get '/' do
    # puts "Main Index Page"
    erb :index
  end


  ## Helpers ##

  helpers do
    def logged_in?
      # puts "Check if Logged in"
      !!session[:user_id]
    end

    def current_user
      # puts "Find Current User"
      if logged_in?
        User.find(session[:user_id])
      end
    end

    def redirect_if_not_logged_in
      if !logged_in?
        puts "User Not Logged In"
        redirect to "/login"
      end
    end

  end

end

# Referenced Labs
# nyc-sinatra-v-000 || playlister-sinatra-v-000 || sinatra-complex-forms-associations-v-000
# sinatra-secure-password-lab-v-000 || sinatra-user-auth-v-000
