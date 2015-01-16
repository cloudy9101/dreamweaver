class StaticPagesController < ApplicationController
	def index
		if signed_in?
			@followings = current_user.followings
			@following_targets = current_user.abstract_targets
			@following_events = (Day.from_followings_by(current_user) + Target.from_followings_by(current_user) + Relationship.from_followings_by(current_user)).to_a.sort_by!{|x| x.created_at}.reverse!.shift(15)
			@following_target_events = Day.from_following_targets_by(current_user).to_a.sort_by!{|x| x.created_at}.reverse!.shift(15)
			
			render :events
		else
			@targets = Target.all.order(created_at: :desc).limit(8)
		end
	end

	def hot
		@hots = AbstractTarget.order(hits: :desc).all.paginate(page: params[:page])
	end

	def great
		@targets = AbstractTarget.great.order(created_at: :desc).paginate(:page => params[:page])
	end
end
