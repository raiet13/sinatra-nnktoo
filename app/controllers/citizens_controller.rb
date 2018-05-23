
class CitizensController < ApplicationController

  # Citizen Index Route #
  get '/citizens' do
    # puts "Citizens Index Route"
    redirect_if_not_logged_in
    @citizens = Citizen.all
    erb :'/citizens/citizen_index'
  end

  # Citizen New Route #
  get '/citizens/new' do
    # puts "New Citizen Route"
    @message = session[:error_message]
    redirect_if_not_logged_in
    erb :'/citizens/create_citizen'
  end

  # Citizen New Action #
  post '/citizens' do
    # puts "New Citizen Params = #{params}"
    citizen = Citizen.new(name: params[:name], role: params[:role])
    if citizen.save
      # puts "Save New Citizen"
      session[:error_message] = ""
      redirect to "/citizens/#{citizen.slug}"
    else
      # puts "FAILURE TO SAVE CITIZEN"
      session[:error_message] = "Something went wrong during citizen creation please try again."
      redirect to "/citizens/new"
    end
  end

  # Citizen Show Route #


  # Citizen Edit Route #


  # Citizen Edit Action #


  # Citizen Delete Action #


end

# rake db:migrate SINATRA_ENV=test
