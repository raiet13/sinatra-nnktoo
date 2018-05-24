class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |o|
      o.string :name
      o.string :type
      o.integer :user_id
    end
  end
end
