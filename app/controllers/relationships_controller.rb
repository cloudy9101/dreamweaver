class RelationshipsController < ApplicationController
  def create
  	@user = User.find(params[:relationship][:following_id])
  	current_user.relationships.create!(following_id: @user.id)
  	redirect_to @user
  end

  def destroy
  	@user = User.find(params[:relationship][:following_id])
  	current_user.relationships.find_by(following_id: @user.id).destroy
  	redirect_to @user
  end
end
