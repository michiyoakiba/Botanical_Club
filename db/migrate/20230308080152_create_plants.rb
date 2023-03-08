class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :plant_name
      t.text :caption
      t.timestamps
    end
  end
end
