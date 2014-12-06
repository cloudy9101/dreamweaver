class DaysController < ApplicationController

  def create
    @target = Target.find(params[:target_id])
    @day = @target.days.new(day_params)
    @day.date_at = Time.now.strftime "%Y-%m-%d"
    if Day.find_by(date_at: Time.now.strftime("%Y-%m-%d")).nil?
      @day.save
      redirect_to @target
    else
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
  end

  def destroy
  end

  private 
    def day_params
      params.require(:day).permit(:comment)
    end
end
