class UsersController < ApplicationController
	before_action :require_login
  def show
  	@targets = current_user.targets.paginate(:page => params[:page], :per_page => 3)
  end

  def edit
  	
  end

  private
  	def require_login
  		unless signed_in?
  			flash[:info] = "请您登录。"
  			redirect_to root_url
  		end
  	end
end
