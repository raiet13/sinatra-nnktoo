class CreateKingdomCitizens < ActiveRecord::Migration[5.2]
  def change
    create_table :kingdom_citizens do |kc|
      kc.integer :kingdom_id
      kc.integer :citizen_id
    end
  end
end
