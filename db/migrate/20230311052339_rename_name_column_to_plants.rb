class RenameNameColumnToPlants < ActiveRecord::Migration[6.1]
  def change
    rename_column :plants, :name, :plant_name
  end
end
