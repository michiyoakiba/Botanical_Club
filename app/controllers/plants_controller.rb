class PlantsController < ApplicationController
  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user_id = current_user.id
    if @plant.save
      redirect_to plants_path
    else
      render :new
    end  
  end
  
  def index
    # @plants = Plant.page(params[:page])
    @q = Plant.ransack(params[:q])
    # binding.pry
    @plants = @q.result.page(params[:page])#(distinct: true)#.includes(:plant_name).page(params[:page]).order("created_at desc")
    
  end

  def show
    @plant = Plant.find(params[:id])
    @plant_comment = PlantComment.new
  end
  
  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to plants_path
  end
  
  private

  def plant_params
    params.require(:plant).permit(:plant_name, :image, :caption)
  end
  
end
