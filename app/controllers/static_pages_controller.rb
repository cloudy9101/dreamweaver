class StaticPagesController < ApplicationController
	def index
		if signed_in?
			redirect_to targets_path
		else
			@targets = Target.all.order(created_at: :desc).limit(5)
		end
	end

	def hot
		@hots = Target.all.order(hits: :desc).paginate(:page => params[:page], :per_page => 6)
	end

	def great
		@targets = Target.great.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)
	end
end
