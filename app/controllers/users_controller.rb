class UsersController < ApplicationController
	before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
    @targets = @user.targets.paginate(:page => params[:page], :per_page => 6)
    @co = 0
    @user.targets.each do |t|
      @co = @co + t.days.count
    end
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
