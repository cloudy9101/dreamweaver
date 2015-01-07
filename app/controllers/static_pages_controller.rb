class StaticPagesController < ApplicationController
	before_action :authenticate_user!, only: [:category]
	def index
		if signed_in?
			redirect_to targets_path
		else
			@targets = Target.all.order(created_at: :desc).limit(5)
		end
	end

	def hot
		# Unfinished
		@hots = Target.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)
		@new_user = User.new
	end

	def category
		@targets = Target.category(params[:c]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)
		case params[:c].to_i
		when 1
			@cate = "工作"
		when 2
			@cate = "生活"
		when 3
			@cate = "健康"
		else
			@cate = "学习"
		end
	end

	def great
		@targets = Target.great.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)
	end
end
