class DaysController < ApplicationController
  before_action :authenticate_user!

  def create
    @target = Target.find(params[:target_id])
    @day = @target.days.new(day_params)
    @day.date_at = Time.now.strftime "%Y-%m-%d"
    if @target.days.find_by(date_at: Time.now.strftime("%Y-%m-%d")).nil?
      if @day && @day.save
        redirect_to @target
      else
        flash[:error] = "内容不能为空"
        redirect_to @target
      end
    else
      flash[:error] = "今日已打卡"
      redirect_to @target
    end
  end

  def edit
  end

  def update
  end

  def show
    @new_user = User.new
    @day = Day.find(params[:id])
    respond_to do |format|
      format.html { redirect_to @day }
      format.js {}
      format.json { render json: @day, status: :created, location: @day } 
    end
  end

  def destroy
  end

  private 
    def day_params
      params.require(:day).permit(:comment)
    end
end
