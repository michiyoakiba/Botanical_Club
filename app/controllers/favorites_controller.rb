class FavoritesController < ApplicationController
    
  def create
    plant = Plant.find(params[:plant_id])
    favorite = current_user.favorites.new(plant_id: plant.id)
    favorite.save
    redirect_to plant_path(plant)
  end

  def destroy
    plant = Plant.find(params[:plant_id])
    favorite = current_user.favorites.find_by(plant_id: plant.id)
    favorite.destroy
    redirect_to plant_path(plant)
  end
  
end
