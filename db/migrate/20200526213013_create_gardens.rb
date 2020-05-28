class CreateGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :gardens do |t|
      t.references :gardeners, foreign_key: true
      t.references :plants, foreign_key: true
    end
  end
end
