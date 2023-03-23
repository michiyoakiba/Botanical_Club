class PlantCommentsController < ApplicationController
  
  # 部分テンプレートにした箇所(コメント機能非同期通信箇所)
  # def create
  #   plant = Plant.find(params[:plant_id])
  #   comment = current_user.plant_comments.new(plant_comment_params)
  #   comment.plant_id = plant.id
  #   comment.save
  #   redirect_to plant_path(plant)
  # end
  
  # def destroy
  #   @plant = Plant.find(params[:plant_id])
  #   plant_comment = @plant.plant_comments.find(params[:id])
  #   plant_comment.destroy
  #   redirect_to plant_path(params[:plant_id])
  # end
  
  # コメント機能非同期通信箇所
  def create
    @plant = Plant.find(params[:plant_id])
    comment = current_user.plant_comments.new(plant_comment_params)
    comment.plant_id = @plant.id
    comment.save
    render 'plants/show'
  end

  def destroy
    @plant = Plant.find(params[:plant_id])
    plant_comment = @plant.plant_comments.find_by(params[:id])
    plant_comment.destroy
  end
  
  private

  def plant_comment_params
    params.require(:plant_comment).permit(:comment)
  end  
    
end