class PlantsController < ApplicationController
  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user_id = current_user.id
    if @plant.save
       flash[:notice] = "You have created plant successfully."  
       redirect_to plants_path
    else
       render :new
    end  
  end
  
  def index
    @plants = Plant.page(params[:page])
    
  end

  def show
    @plant = Plant.find(params[:id])
    @plant_comment = PlantComment.new
  end
  
  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    flash[:notice] = "plant was successfully destroyed."
    redirect_to plants_path
  end
  
  private

  def plant_params
    params.require(:plant).permit(:plant_name, :image, :caption)
  end
  
end