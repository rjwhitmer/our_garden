class CreateGardeners < ActiveRecord::Migration[6.0]
  def change 
    create_table :gardeners do |t|
      t.text :name
      t.integer :age
      t.integer :years_experience
    end
  end
end
