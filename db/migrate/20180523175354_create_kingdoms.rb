class CreateKingdoms < ActiveRecord::Migration
  def change
    create_table :kingdoms do |k|
      k.integer :user_id
      k.string :name
    end
  end
end
