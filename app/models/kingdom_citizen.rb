class KingdomCitizen < ActiveRecord::Base

  belongs_to :kingdom
  belongs_to :citizen

end
