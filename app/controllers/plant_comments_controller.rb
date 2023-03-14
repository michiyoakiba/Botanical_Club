class PlantCommentsController < ApplicationController

  def create
    @plant = Plant.find(params[:plant_id])
    comment = current_user.plant_comments.new(plant_comment_params)
    comment.plant_id = @plant.id
    comment.save
    # redirect_to plant_path(plant)
    render 'error'
  end
  
  def destroy
    @plant = Plant.find(params[:plant_id])
    plant_comment = @plant.plant_comments.find(params[:id])
    plant_comment.destroy
    # PlantComment.find(params[:id]).destroy
    # redirect_to plant_path(params[:plant_id])
  end

  private

  def plant_comment_params
    params.require(:plant_comment).permit(:comment)
  end  
    
end
