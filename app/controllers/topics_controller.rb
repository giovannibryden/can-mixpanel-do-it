class TopicsController < ApplicationController
  
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:create, :destroy]

  def new
  end

  def home
  end

  def index
    @delete_tag_button = false
    @topics = Topic.last(5).reverse()
  end

  def show
    @delete_tag_button = true
    @comment = Comment.new(:topic => @topic)
    @tag = Tag.new(:topic => @topic)
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

  def results
    @search = params[:search]
    @topics = Topic.find_by_sql ["SELECT * FROM topics INNER JOIN tags ON topics.id = tags.topic_id WHERE topics.topic LIKE ? OR tags.name LIKE ? LIMIT 1","%"+params[:search]+"%","%"+params[:search]+"%"]
  end

  def destroy
    if current_user.email == @topic.author
      @topic.destroy
      flash[:success] = "Topic successfully deleted."
      redirect_to root_url
    else
      flash[:notice] = "You may only delete your own topics."
      redirect_to :back
    end
  end
end

private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:topic,:body,:user_id,:author)
  end

  # def require_login
  #   if !logged_in?
  #     flash[:error] = "Log in to perform this action."
  #     redirect_to root_url
  #   end
  # end
