class RemoveNameFromPlants < ActiveRecord::Migration[6.1]
  def change
    remove_column :plants, :plant_name, :string
  end
end
