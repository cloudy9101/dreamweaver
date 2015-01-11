class UsersController < ApplicationController
	before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
    @targets = @user.targets.paginate(:page => params[:page])
    @days_count = @user.days.count
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
