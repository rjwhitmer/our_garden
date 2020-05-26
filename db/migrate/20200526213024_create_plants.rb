class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.text :name
      t.integer :days_to_harvest
    end
  end
end
