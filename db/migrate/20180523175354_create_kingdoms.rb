class CreateKingdoms < ActiveRecord::Migration[5.2]
  def change
    create_table :kingdoms do |k|
      k.string :name
    end
  end
end
