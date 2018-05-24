
class KingdomsController < ApplicationController

  # Kingdom Index Route #
  get '/kingdoms' do
    redirect_if_not_logged_in
    @kingdoms = Kingdom.all
    erb :'/kingdoms/kingdom_index'
  end

  # Kingdom New Route #
  get '/kingdoms/new' do
    @message = session[:error_message]
    redirect_if_not_logged_in
    erb :'/kingdoms/create_kingdom'
  end

  # Kingdom New Action #
  post '/kingdoms' do
    kingdom = Kingdom.new(name: params[:name], user_id: current_user.id)
    if kingdom.save
      session[:error_message] = ""
      redirect to "/kingdoms/#{kingdom.slug}"
    else
      session[:error_message] = "Something went wrong during kingdom creation please try again."
      redirect to "/kingdoms/new"
    end
  end

  # Kingdom Show Route #
  get '/kingdoms/:slug' do
    redirect_if_not_logged_in
    @kingdom = Kingdom.find_by_slug(params[:slug])
    @message = session[:error_message]
    erb :'/kingdoms/show_kingdom'
  end

  # Kingdom Edit Route #
  get '/kingdoms/:slug/edit' do
    @message = session[:error_message]
    redirect_if_not_logged_in
    @kingdom = Kingdom.find_by_slug(params[:slug])
    @citizens = Citizen.all
    if current_user.id == @kingdom.user.id
      session[:error_message] = ""
      erb :'/kingdoms/edit_kingdom'
    else
      session[:error_message] = "Kingdoms can only be modified by their ruler."
      redirect to "/kingdoms/#{@kingdom.slug}"
    end
  end

  # Kingdom Edit Action #
  post '/kingdoms/:slug' do
    kingdom = Kingdom.find_by_slug(params[:slug])

    if !params[:name].empty?
      kingdom.update(name: params[:name])
    end

    # Find Citizens and add to Kingdom's Citizens
    kingdom.citizens.clear
    if params.has_key?(:citizen_ids) && !params[:citizen_ids].empty?
      params["citizen_ids"].each { |id| kingdom.citizens << Citizen.find(id) }
    end

    kingdom.save
    redirect to "/kingdoms/#{kingdom.slug}"
  end

  # Kingdom Delete Action #
  delete '/kingdoms/:slug/delete' do
    kingdom = Kingdom.find_by_slug(params[:slug])
    if logged_in? && kingdom.user.id == current_user.id
      kingdom.delete
    end
    redirect to "/users/#{current_user.slug}"
  end

end
