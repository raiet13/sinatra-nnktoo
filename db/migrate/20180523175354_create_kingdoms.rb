class CreateKingdoms < ActiveRecord::Migration
  def change
    create_table :kingdoms do |k|
      k.string :name
    end
  end
end
