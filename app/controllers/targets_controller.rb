class TargetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @targets = current_user.targets.order(created_at: :desc).paginate(:page => params[:page])
  end

  def show
    @target = Target.find(params[:id])
    @comments = @target.comments.root.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)
    @today = @target.days.new
    Target.increment_counter(:hits, params[:id]) unless @target.user == current_user

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def new
    # @new_target = Target.new
    @abstract_target = current_user.abstract_targets.new
    @abstract_target.targets.build
  end

  def create
    @abstract_target = AbstractTarget.new(target_params)
    @abstract_target.targets.first.user = current_user
    if @abstract_target && @abstract_target.save
      @abstract_target.followed_users << current_user
      redirect_to target_path(@abstract_target.targets.first)
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
    @target = Target.new(follow_params)
    if @target.abstract_target.targets.find_by_user_id(current_user.id)
      redirect_to Target.find(params[:id])
    else
      @target.user = current_user
      @target.save
      @target.followed_users << current_user
      redirect_to @target
    end
  end

  def like
    @target = Target.find(params[:id])
    if @target.user != current_user && !@target.liked?(current_user)
      @target.like_users << current_user
    end
    respond_to do |format|
      format.html { redirect_to @target }
      format.js {}
    end
  end

  def unlike
    @target = Target.find(params[:id])
    @target.like_users.destroy(current_user) if @target.liked?(current_user)
    respond_to do |format|
      format.html { redirect_to @target }
      format.js {}
    end
  end

  private
    def target_params
      params.require(:abstract_target).permit(:name, :detail, :category_id, targets_attributes: [:id, :start_time, :finish_time])
    end

    def follow_params
      params.require(:target).permit(:start_time, :finish_time, :abstract_target_id)
    end
end
