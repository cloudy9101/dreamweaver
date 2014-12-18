class StaticPagesController < ApplicationController
	before_action :authenticate_user!, only: [:category]
	def index
		if signed_in?
			redirect_to targets_path
		else
			@new_user = User.new
			@targets = Target.all.order(created_at: :desc).limit(5)
		end
	end

	def hot
		# Unfinished
		@hots = Target.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)
		@new_user = User.new
	end

	def category
		@targets = Target.where(["category = ?", params[:c] || 0]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)
		case @targets.first.category
		when 0
			@cate = "学习"
		when 1
			@cate = "工作"
		when 2
			@cate = "生活"
		when 3
			@cate = "健康"
		end

		@new_user = User.new
	end

	def great
		@targets = Target.where(["great = 1"]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)

		@new_user = User.new
	end
end
