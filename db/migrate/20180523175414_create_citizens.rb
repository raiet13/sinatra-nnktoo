class CreateCitizens < ActiveRecord::Migration
  def change
    create_table :citizens do |c|
      c.string :name
      c.string :role
    end
  end
end
