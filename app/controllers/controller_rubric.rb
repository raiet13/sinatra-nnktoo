class PLURALnameController < ApplicationController

  ## NOTE : There should be one controller per model object (excluding join table models)

  # Index Route #
  get '/name' do
    # Check logged in or redirect to log in view
    # Show index view for controller object
  end

  # New Route #
  get '/name/new' do
    # Check logged in or redirect to log in view
    # Show error message if necessary
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
  get '/name/:param' do
    # Check logged in or redirect to log in view
    # Find object based on param (find using id or other param as defined as "find_by_X" in model)
    # Show error message if necessary
    # Show show view for controller object
  end

  # Edit Route #
  get '/name/:param/edit' do
    # Check logged in or redirect to log in view
    # Show error message if necessary
    # Assemble any needed other object data as needed (via @variables for use in erb view)
    # Show edit view for controller object
  end

  # Edit Action #
  post '/name/:param' do
    # Find object based on param
    # Update object using params hash from form post
    # Save object
    # Redirect to object's show view
  end

  # Delete Action #
  delete '/outfits/:slug/delete' do
    # Find object
    # Check if logged in (and that the correct user is trying to delete the object if/as neccessary)
    # Delete (only if the above is true)
    # Redirect to "main page" or whatever
  end


end

# rake db:migrate SINATRA_ENV=test
