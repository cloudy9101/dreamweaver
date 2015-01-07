class TargetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @targets = current_user.targets.order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
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

  private
    def target_params
      params.require(:target).permit(:name, :detail, :start_time, :finish_time, :category_id)
    end
end
