class CreateGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :gardens do |t|
      t.references :gardener
      t.references :plant
    end
  end
end
