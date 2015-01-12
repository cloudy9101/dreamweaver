class UsersController < ApplicationController
	before_action :authenticate_user!

	def followers
		@title = "粉丝"
		@users = User.find(params[:id]).followers.paginate(:page => params[:page], :per_page => 8)
		render :followers
	end

	def followings
		@title = "关注"
		@users = User.find(params[:id]).followings.paginate(:page => params[:page], :per_page => 8)
		render :followers
	end

  def show
  	@user = User.find(params[:id])
    @targets = @user.targets.paginate(:page => params[:page])
  end

  def edit
  	
  end

end
