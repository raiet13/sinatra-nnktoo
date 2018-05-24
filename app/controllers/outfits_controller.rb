class OutfitsController < ApplicationController

  # Outfit Index Route #
  get '/outfits' do
    redirect_if_not_logged_in
    @outfits = Outfit.all
    erb :'/outfits/outfit_index'
  end

  # Outfit New Route #
  get '/outfits/new' do
    @message = session[:error_message]
    redirect_if_not_logged_in
    erb :'/outfits/create_outfit'
  end

  # Outfit New Action #
  post '/outfits' do
    outfit = Outfit.new(name: params[:name], outfit_style: params[:outfit_style], user_id: current_user.id)

    if outfit.save
      session[:error_message] = ""
      redirect to "/outfits/#{outfit.slug}"
    else
      session[:error_message] = "Something went wrong during outfit creation please try again."
      redirect to "/outfits/new"
    end
  end

  # Outfit Show Route #
  get '/outfits/:slug' do
    redirect_if_not_logged_in
    @outfit = Outfit.find_by_slug(params[:slug])
    @message = session[:error_message]
    erb :'/outfits/show_outfit'
  end

  # Outfit Edit Route #
  get '/outfits/:slug/edit' do
    @message = session[:error_message]
    redirect_if_not_logged_in
    @outfit = Outfit.find_by_slug(params[:slug])

    if @outfit.user_id == current_user.id
      session[:error_message] = ""
      erb :'/outfits/edit_outfit'
    else
      session[:error_message] = "Outfits can only be modified by their Owners."
      redirect to "/outfits/#{@outfit.slug}"
    end
  end

  # Outfit Edit Action #
  post '/outfits/:slug' do
    outfit = Outfit.find_by_slug(params[:slug])
    outfit.name = params[:name] if !params[:name].empty?
    outfit.outfit_style = params[:outfit_style] if !params[:outfit_style].empty?

    outfit.save
    redirect to "/outfits/#{outfit.slug}"
  end

  # Outfit Delete Action #
  delete '/outfits/:slug/delete' do
    outfit = Outfit.find_by_slug(params[:slug])
    if logged_in?
      outfit.delete
    end
    redirect to "/users/#{current_user.slug}"
  end

end
