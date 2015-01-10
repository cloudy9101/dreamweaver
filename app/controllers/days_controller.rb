class DaysController < ApplicationController
  before_action :authenticate_user!
  before_action :target_user_is_current_user, except: :show

  def create
    @day = Day.new(day_params)
    @day.target = Target.find(params[:target_id])
    @day.user = current_user
    @day.date_at = Time.now.strftime "%Y-%m-%d"

    if @day && @day.save
      flash[:success] = "恭喜您，打卡成功。"
    else
      flash[:error] = "打卡失败，您今日已打过卡或打卡内容为空。"
    end
    redirect_to @day.target
  end

  def edit
  end

  def update
  end

  def show
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

    def target_user_is_current_user
      unless Target.find(params[:target_id]).user == current_user
        redirect_to target_path(params[:target_id])
      end
    end
end
