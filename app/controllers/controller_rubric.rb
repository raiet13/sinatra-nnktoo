class PLURALnameController < ApplicationController

  ## NOTE : There should be one controller per model object (excluding join table models)

  # Index Route #
  get '/name' do
    # Check logged in or redirect to log in page
    # Show index view for controller object
  end

  # New Route #
  get '/name/new' do
    # Check logged in or redirect to log in page
    # Show creation view for controller object
  end

  # New Action #
  post '/name' do
    # Create new object with params hash
    # Check if saved properly (using validates_presence_of in object model)
    # If successfully created/added to database then redirect to show route
    # Otherwise redirect back to new route with error message alerting user to failure
  end

  # Show Route #

  # Edit Route #

  # Edit Action #

  # Delete Action #


end

# rake db:migrate SINATRA_ENV=test
