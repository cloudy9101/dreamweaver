class CategorysController < ApplicationController
  def show
  	@ctg = Category.find(params[:id])
  	@targets = @ctg.targets.paginate(:page => params[:page])
  end
end
