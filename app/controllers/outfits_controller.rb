class OutfitsController < ApplicationController

  # Outfit Index Route #
  get '/outfits' do
    # puts "Outfit Index Route"
    redirect_if_not_logged_in
    @outfits = Outfit.all
    erb :'/outfits/outfit_index'
  end

  # Outfit New Route #
  get '/outfits/new' do
    # puts "New Outfit Route"
    @message = session[:error_message]
    redirect_if_not_logged_in
    erb :'/outfits/create_outfit'
  end

  # Outfit New Action #
  post '/outfits' do
    # puts "New Outfit Params = #{params}"
    outfit = Outfit.new(name: params[:name], outfit_type: params[:outfit_type], user_id: current_user.id)

    if outfit.save
      # puts "Save New Outfit"
      session[:error_message] = ""
      redirect to "/outfits/#{outfit.slug}"
    else
      # puts "FAILURE TO SAVE Outfit"
      session[:error_message] = "Something went wrong during outfit creation please try again."
      redirect to "/outfits/new"
    end
  end

  # Outfit Show Route #
  get '/outfits/:slug' do
    # puts "Outfit Show Route"
    redirect_if_not_logged_in
    @outfit = Outfit.find_by_slug(params[:slug])
    @message = session[:error_message]
    erb :'/outfits/show_outfit'
  end

  # Outfit Edit Route #
  get '/outfits/:slug/edit' do
    # puts "Edit Outfit Route"
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
    # puts "Edit Outfit Params = #{params}"
    outfit = Outfit.find_by_slug(params[:slug])
    outfit.name = params[:name] if !params[:name].empty?
    outfit.outfit_type = params[:outfit_type] if !params[:outfit_type].empty?

    outfit.save
    redirect to "/outfits/#{outfit.slug}"
  end

  # Outfit Delete Action #


end

# rake db:migrate SINATRA_ENV=test
