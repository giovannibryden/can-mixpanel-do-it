class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:success] = "Comment posted successfully."
			redirect_to :back
		else
			flash[:notice] = "Error :("
			redirect_to :back
		end
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
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
