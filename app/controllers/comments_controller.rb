class CommentsController < ApplicationController

  def create
  	@target = Target.find(params[:comment][:target_id])
  	@comment = current_user.comments.new(comment_params)

  	respond_to do |format|
  		if @comment && @comment.save
  			format.html { redirect_to @target }
	  		format.js {}
	  	else
	  		format.html { redirect_to @target }
	  	end
  	end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@target = @comment.target
  	respond_to do |format|
  		if @comment.user == current_user
  			@comment.destroy
  			format.html { redirect_to @target }
  			format.js {}
  		else
  			format.html { redirect_to @target}
  		end
  	end
  end

  private
  	def comment_params
  		params.require(:comment).permit(:target_id, :content, :root_id)
  	end
end
