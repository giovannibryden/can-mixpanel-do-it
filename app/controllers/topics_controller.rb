class TopicsController < ApplicationController
  def new
  end

  def home
  end

  def index
    @topics = Topic.last(5)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.create(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @topic } 
      else
        format.html { render action: 'new' }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end
end

private
  def topic_params
    params.require(:topic).permit(:topic,:body)
  end
