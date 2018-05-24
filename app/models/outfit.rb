class Outfit < ActiveRecord::Base

  validates_presence_of :name, :outfit_type
  belongs_to :user

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.each do |outfit|
      if outfit.slug == slug
        return outfit
      end
    end
  end

end
