class TargetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @targets = current_user.targets.order(created_at: :desc).paginate(:page => params[:page])
  end

  def show
    @target = Target.find(params[:id])
    @today = @target.days.new
    @target.update_attribute('hits', @target.hits + 1)
  end

  def new
    @new_target = Target.new
  end

  def create
    @new_target = current_user.targets.build(target_params)
    if @new_target && @new_target.save
      redirect_to target_path(@new_target)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @target = Target.find(params[:id])
    if @target.user_id == current_user.id
      @target.destroy
    end
    redirect_to root_path
  end

  def followed
    @target = Target.find(params[:id])
    if @target.user != current_user && !@target.followed_users.include?(current_user)
      @target.followed_users << current_user
    end
    respond_to do |format|
      format.html { redirect_to @target }
      format.js {}
    end
  end

  def unfollowed
    @target = Target.find(params[:id])
    @target.followed_users.destroy(current_user) if @target.followed?(current_user)
    respond_to do |format|
      format.html { redirect_to @target }
      format.js {}
    end
  end

  private
    def target_params
      params.require(:target).permit(:name, :detail, :start_time, :finish_time, :category_id)
    end
end
