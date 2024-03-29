class SearchesController < ApplicationController
    
  def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		else
			@records = Plant.search_for(@content, @method).page(params[:page])
		end
  end
  
end