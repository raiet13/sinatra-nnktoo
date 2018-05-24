
class OutfitsController < ApplicationController

  # Outfit Index Route #
  get '/outfits' do
    # puts "Outfit Index Route"
    redirect_if_not_logged_in
    @outfits = Outfit.all
    erb :'/outfits/outfit_index'
  end

  # Outfit New Route #

  # Outfit New Action #

  # Outfit Show Route #

  # Outfit Edit Route #

  # Outfit Edit Action #

  # Outfit Delete Action #


end

# rake db:migrate SINATRA_ENV=test
