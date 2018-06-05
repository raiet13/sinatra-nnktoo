
class CitizensController < ApplicationController

  # Citizen Index Route #
  get '/citizens' do
    redirect_if_not_logged_in
    @citizens = Citizen.all
    erb :'/citizens/citizen_index'
  end

  # Citizen New Route #
  get '/citizens/new' do
    @message = session[:error_message]
    @kingdoms = Kingdom.all
    redirect_if_not_logged_in
    erb :'/citizens/create_citizen'
  end

  # Citizen New Action #
  post '/citizens' do
    citizen = Citizen.new(name: params[:name], role: params[:role])

    if params.has_key?(:kingdom_ids) && !params[:kingdom_ids].empty?
      params["kingdom_ids"].each { |id| citizen.kingdoms << Kingdom.find(id) }
    end

    if citizen.save
      session[:error_message] = ""
      redirect to "/citizens/#{citizen.slug}"
    else
      session[:error_message] = "Something went wrong during citizen creation please try again."
      redirect to "/citizens/new"
    end
  end

  # Citizen Show Route #
  get '/citizens/:slug' do
    redirect_if_not_logged_in
    @citizen = Citizen.find_by_slug(params[:slug])
    @message = session[:error_message]
    erb :'/citizens/show_citizen'
  end

  # Citizen Edit Route #
  get '/citizens/:slug/edit' do
    @message = session[:error_message]
    redirect_if_not_logged_in
    @citizen = Citizen.find_by_slug(params[:slug])
    kingdom_users = @citizen.kingdoms.collect do |kingdom|
      kingdom.user_id
    end

    if kingdom_users.include?(current_user.id)
      session[:error_message] = ""
      # @kingdoms = Kingdom.all
      erb :'/citizens/edit_citizen'
    else
      session[:error_message] = "Citizens can only be modified by rulers of kingdoms that they are part of."
      redirect to "/citizens/#{@citizen.slug}"
    end
  end

  # Citizen Edit Action #
  post '/citizens/:slug' do
    citizen = Citizen.find_by_slug(params[:slug])

    citizen.name = params[:name] if !params[:name].empty?
    citizen.role = params[:role] if !params[:role].empty?

    # Find Kingdoms and add to Citizen's Kingdoms
    non_user_kingdoms = []
    citizen.kingdoms.each do |kingdom|
      if kingdom.user_id != current_user.id
        non_user_kingdoms << kingdom.id
      end
    end
    citizen.kingdoms.clear
    if params.has_key?(:kingdom_ids) && !params[:kingdom_ids].empty?
      params["kingdom_ids"].each { |id| citizen.kingdoms << Kingdom.find(id) }
    end
    non_user_kingdoms.each { |id| citizen.kingdoms << Kingdom.find(id) }

    citizen.save
    redirect to "/citizens/#{citizen.slug}"
  end

  # Citizen Delete Action #
  delete '/citizens/:slug/delete' do
    citizen = Citizen.find_by_slug(params[:slug])
    if logged_in?
      citizen.delete
    end
    redirect to "/users/#{current_user.slug}"
  end

end
