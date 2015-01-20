class AbstractTargetsController < ApplicationController
  before_action :authenticate_user!

  def new
    # @new_target = Target.new
    @abstract_target = current_user.abstract_targets.new
    @abstract_target.targets.build
  end

  def create
    @abstract_target = AbstractTarget.new(target_params)
    @abstract_target.targets.first.user = current_user
    if @abstract_target && @abstract_target.save
      redirect_to target_path(@abstract_target.targets.first)
    else
      render 'new'
    end
  end

  def show
    @abstract_target = AbstractTarget.find(params[:id])
    @targets = @abstract_target.targets.order(created_at: :desc).paginate(:page => params[:page])
    AbstractTarget.increment_counter(:hits, params[:id])
  end

  private
    def target_params
      params.require(:abstract_target).permit(:name, :detail, :category_id, targets_attributes: [:id, :start_time, :finish_time])
    end
end
