class RelationshipsController < ApplicationController
  def create
  	@user = User.find(params[:relationship][:following_id])
    unless current_user.followings.include?(@user) || current_user == @user
    	current_user.relationships.create!(following_id: @user.id) 
    end
    respond_to do |format|
      format.html { redirect_to @user }
      format.js {}
    end
  	
  end

  def destroy
  	@user = User.find(params[:relationship][:following_id])
    if current_user.followings.include?(@user)
    	current_user.relationships.find_by(following_id: @user.id).destroy
    end
  	respond_to do |format|
      format.html { redirect_to @user }
      format.js {}
    end
  end
end
