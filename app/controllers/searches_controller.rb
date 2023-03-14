class SearchesController < ApplicationController
    
  def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		@records = Plant.search_for(@content, @method).page(params[:page])
	end
  
end
