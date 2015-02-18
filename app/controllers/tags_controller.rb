class TagsController < ApplicationController
	def create
		@topic = Topic.find_by(id: params[:topic_id])
		@tag = Tag.new(tag_params)
		if @tag.save
			flash[:success] = "Successfully created a tag!"
			redirect_to :back
		else
			flash[:notice] = "You suck at creating tags."
			redirect_to :back
		end
	end

	def destroy
		@topic = Topic.find_by(:id params[:topic_id])
		@tag = @topic.tags.find(:id)
		@tag.destroy
		redirect_to :back
	end

private

	def tag_params
		params.require(:tag).permit(:name,:topic_id)
	end
end
