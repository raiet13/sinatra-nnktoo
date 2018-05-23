
class CitizensController < ApplicationController

  # Citizen Index Route #
  get '/citizens' do
    # puts "Citizens Index Route"
    redirect_if_not_logged_in
    @citizens = Citizen.all
    erb :'/citizens/citizen_index'
  end


  # Citizen New Route #


  # Citizen New Action #


  # Citizen Show Route #


  # Citizen Edit Route #


  # Citizen Edit Action #


  # Citizen Delete Action #


end

# rake db:migrate SINATRA_ENV=test
