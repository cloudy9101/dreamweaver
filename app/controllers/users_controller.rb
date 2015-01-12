class UsersController < ApplicationController
	before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
    @targets = @user.targets.paginate(:page => params[:page])
  end

  def edit
  	
  end

end
