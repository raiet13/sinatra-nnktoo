class User < ActiveRecord::Base

  has_secure_password
  validates_presence_of :username, :password
  has_many :kingdoms
  has_many :kingdom_citizens, through: :kingdoms
  has_many :citizens, through: :kingdom_citizens

  def slug
    self.username.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.each do |user|
      if user.slug == slug
        return user
      end
    end
  end

end
