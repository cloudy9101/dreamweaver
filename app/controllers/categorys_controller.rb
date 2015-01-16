class CategorysController < ApplicationController
  def show
  	@ctg = Category.find(params[:id])
  	@targets = @ctg.abstract_targets.order(hits: :desc).paginate(:page => params[:page])
  end
end
