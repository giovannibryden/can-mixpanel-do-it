class CommentsController < ApplicationController
	def create
		@comment = Comment.new
	end

	def destroy
		@comment = Comment.find_by(params[:id])
	end

	def show
		# Placeholder
	end
end
