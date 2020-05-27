class AddNameToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :name, :text
  end
end
