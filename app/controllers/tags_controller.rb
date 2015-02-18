class TagsController < ApplicationController
	def create
		@tag = Tag.new(tag_params)
		if @tag.save
			flash[:success] = "Successfully created a tag!"
		else
			flash[:notice] = "You suck at creating tags."
	end

private

def tag_params
	params.require(:tag).permit(:name,:topic_id)
end
end
