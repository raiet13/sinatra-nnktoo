class Kingdom < ActiveRecord::Base

  validates_presence_of :name
  belongs_to :user
  has_many :kingdom_citizens
  has_many :citizens, through: :kingdom_citizens

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.each do |kingdom|
      if kingdom.slug == slug
        return kingdom
      end
    end
  end

end
