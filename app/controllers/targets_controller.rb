class TargetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @targets = current_user.targets.paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @new_user = User.new
    @target = Target.find(params[:id])
    @today = @target.days.new
  end

  def new
    @new_target = Target.new
  end

  def create
    @new_target = current_user.targets.build(target_params)
    if @new_target && @new_target.save
      redirect_to root_path
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
      params.require(:target).permit(:name, :detail, :start_time, :finish_time, :category)
    end
end
