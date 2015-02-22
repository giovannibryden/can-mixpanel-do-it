class CommentsController < ApplicationController

before_action :require_login, only: [:create, :destroy]

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:success] = "Comment posted successfully."
			redirect_to :back
		else
			flash[:notice] = "Comment was not posted successfully."
			redirect_to :back
		end
	end

	def destroy
		comment = Comment.find(params[:id])
		if current_user.email == comment.email
			comment.destroy
		else
			flash[:notice] = "You may only delete your own comments."
		end
		redirect_to :back
	end

	def show
		# Placeholder
	end

	private

	def comment_params
		params.require(:comment).permit(:name,:email,:body,:topic_id)
	end
end
