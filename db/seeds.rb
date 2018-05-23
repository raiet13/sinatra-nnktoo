
# Sample Seed Methods in
  # Hash = nyc-sinatra-v-000
  # Object by Object = sinatra-logging-in-and-out-v-000

# Users/Rulers
  user1 = User.create(:username => "ruler1", :password => "ruler1")
  user2 = User.create(:username => "ruler2", :password => "ruler2")
  user3 = User.create(:username => "ruler3", :password => "ruler3")
  user4 = User.create(:username => "ruler4", :password => "ruler4")
  user5 = User.create(:username => "ruler5", :password => "ruler5")

# Kingdoms
  kingdom1 = Kingdom.create(:name => "kingdom1", :user_id => user1.id)
  kingdom2 = Kingdom.create(:name => "kingdom2", :user_id => user1.id)
  kingdom3 = Kingdom.create(:name => "kingdom3", :user_id => user2.id)

# Citizens
  citizen1 = Citizen.create(:name => "citizen1", :role => "worker")
  citizen2 = Citizen.create(:name => "citizen2", :role => "librarian")
  citizen3 = Citizen.create(:name => "citizen3", :role => "worker")
  citizen4 = Citizen.create(:name => "citizen4", :role => "shopkeeper")
  citizen5 = Citizen.create(:name => "citizen5", :role => "magician")

# Kingdom - Citizens Associations
  kingdom1.citizens << citizen1
  kingdom1.citizens << citizen2
  kingdom2.citizens << citizen4
