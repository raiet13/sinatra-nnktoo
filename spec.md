# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [X] Use ActiveRecord for storing information in a database <<-- All models inherit from ActiveRecord::Base and save/retrieve data from a database
- [X] Include more than one model class (list of model class names e.g. User, Post, Category) <<-- Have 5 models (User, Kingdom, KingdomCitizen, Citizen, and Outfit)
- [X] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts) <<-- Users can have many kingdoms and kingdoms can have many citizens and citizens can have many kingdoms and Users can have many outfits
- [X] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User) <<-- kingdoms belong to users and outfits belong to users
- [X] Include user accounts <<-- Added seeds for users and uses users as the base for the app
- [X] Ensure that users can't modify content created by other users <<-- Access to the modification features for user data can only be accessed by the user that the data belongs to (checking on the modification routes that only the user associated with the data can modify it)
- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying <<-- Each model (aside from the KingdomCitizen join model) has a unique controller and views for CRUD functionality
- [X] Include user input validations <<-- all user input is checked using the "validates_presence_of" macro in their individual models and then again in the post action routes
- [X] Display validation failures to user with error message (example form URL e.g. /posts/new) <<-- using session token to modify the "redirect to" pages and alert the user if user input has failed
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
