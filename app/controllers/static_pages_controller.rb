class StaticPagesController < ApplicationController
	def index
		@new_user = User.new
	end
end
