
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
    @message = session[:error_message]
    redirect_if_not_logged_in
    erb :'/kingdoms/create_kingdom'
  end

  # Kingdom New Action #
  post '/kingdoms' do
    puts "New Kingdom Params = #{params}"
    kingdom = Kingdom.new(name: params[:name], user_id: current_user.id)
    if kingdom.save
      puts "Save New Kingdom"
      session[:error_message] = ""
      redirect to "/kingdoms/#{kingdom.slug}"
    else
      puts "FAILURE TO SAVE KINGDOM"
      session[:error_message] = "Something went wrong during kingdom creation please try again."
      redirect to "/kingdoms/new"
    end
  end

  # Kingdom Show Route #
  get '/kingdoms/:slug' do
    puts "Kingdom Show Route"
    redirect_if_not_logged_in
    @kingdom = Kingdom.find_by_slug(params[:slug])
    @session = session  # << -- NOTE : Currently just for testing purposes
    erb :'/kingdoms/show_kingdom'
  end

  # Kingdom Edit Route #
  get '/kingdoms/:slug/edit' do
    # puts "Edit Kingdom Route"
    @message = session[:error_message]
    redirect_if_not_logged_in
    @kingdom = Kingdom.find_by_slug(params[:slug])
    erb :'/kingdoms/edit_kingdom'
  end

  # Kingdom Edit Action #
  post '/kingdoms/:slug' do
    # puts "Edit Kingdom Params = #{params}"
    kingdom = Kingdom.find_by_slug(params[:slug])

    if !params[:name].empty?
      # puts "Allow Edit of Kingdom Name"
      kingdom.update(name: params[:name])
    end

    # Find Citizens and add to Kingdom's Citizens
    if params.has_key?(:citizen_ids) && !params[:citizen_ids].empty?
      params["citizen_ids"].each { |id| kingdom.citizens << Citizen.find(id) }
      # puts "Add citizen : #{kingdom.citizens.count}"
    end

    kingdom.save
    redirect to "/kingdoms/#{kingdom.slug}"
  end


  # Kingdom Delete Action #


end
