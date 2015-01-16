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

  def create
    @target = Target.new(follow_params)
    if @target.abstract_target.users.include?(current_user)
      flash[:error] = "对不起，您已有该目标"
      redirect_to @target.abstract_target.targets.find_by_user_id(current_user.id)
    else
      @target.user = current_user
      @target.save
      redirect_to @target
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
      @target.abstract_target.destroy if @target.abstract_target.targets.empty?
    end
    redirect_to root_path
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
    def follow_params
      params.require(:target).permit(:start_time, :finish_time, :abstract_target_id)
    end
end
