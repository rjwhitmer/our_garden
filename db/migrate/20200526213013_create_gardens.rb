class CreateGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :gardens do |t|
      t.text :name
      t.integer :plant_id
      t.integer :gardener_id
    end
  end
end
