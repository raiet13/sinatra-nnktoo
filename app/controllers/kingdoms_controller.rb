
class KingdomsController < ApplicationController

  # Kingdom Index Route #
  get '/kingdoms' do
    puts "Kingdoms Index Route"
    redirect_if_not_logged_in
    @kingdoms = Kingdom.all
    # @user = User.find(session[:user_id]) # <<-- NOTE : Check if can use current_user in view rather than use this
    erb :'/kingdoms/kingdom_index'
  end

  # Kingdom New Route #
  get '/kingdoms/new' do
    puts "New Kingdom Route"
    redirect_if_not_logged_in
    erb :'/kingdoms/create_kingdom'
  end

  # Kingdom New Action #


  # Kingdom Show Route #


  # Kingdom Edit Route #


  # Kingdom Edit Action #


  # Kingdom Delete Action #


end
