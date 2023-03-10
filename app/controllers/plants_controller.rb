class PlantsController < ApplicationController
  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user_id = current_user.id
    @plant.save
    redirect_to plants_path
  end

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end
  
  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to plants_path
  end
  
  private

  def plant_params
    params.require(:plant).permit(:name, :image, :caption)
  end
  
end
