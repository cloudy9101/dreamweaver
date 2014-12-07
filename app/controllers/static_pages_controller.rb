class StaticPagesController < ApplicationController
	def index
		if signed_in?
			redirect_to users_url(current_user)
		else
			@new_user = User.new
			@targets = Target.all.order(created_at: :desc).limit(10)
		end
	end
end
