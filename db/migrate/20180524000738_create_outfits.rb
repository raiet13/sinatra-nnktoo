class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |o|
      o.string :name
      o.string :outfit_style
      o.integer :user_id
    end
  end
end
