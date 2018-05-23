class CreateCitizens < ActiveRecord::Migration[5.2]
  def change
    create_table :citizens do |c|
      c.string :name
      c.string :role
    end
  end
end
