class StaticPagesController < ApplicationController
	def index
		if signed_in?
			redirect_to users_url(current_user)
		else
			@new_user = User.new
			@targets = Target.all.order(created_at: :desc).limit(10)
		end
	end
	def hot
		@hots = Target.all.order(created_at: :desc)
		@new_user = User.new
	end
end
