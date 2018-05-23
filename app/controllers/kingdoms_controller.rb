
class KingdomsController < ApplicationController

  get '/kingdoms' do
    puts "Kingdoms Index Route"
    redirect_if_not_logged_in
    @kingdoms = Kingdom.all
    # @user = User.find(session[:user_id]) # <<-- NOTE : Check if can use current_user in view rather than use this
    erb :'/kingdoms/kingdom_index'
  end

  get '/kingdoms/new' do
    puts "New Kingdom Route"
    redirect_if_not_logged_in
    erb :'/kingdoms/create_kingdom'
  end

end
