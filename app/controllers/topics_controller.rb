class TopicsController < ApplicationController
  def index
    @user = current_user
    @topics = @user.topics
  end

  def show
    @user = current_user
    @topic = Topic.find(params[:id])
  end

  def new
    @user = current_user
    @topic = Topic.new
  end

  def create
    @user = current_user
    @topic = @user.topics.build(topic_params)

    redirect_to [@user, @topic] if @topic.save
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

    redirect_to [@topic.user, @topic] if @topic.save
  end

  def destroy
    @topic = Topic.find(params[:id])
    redirect_to action: :index if @topic.destroy
  end


  private

  def topic_params
    params.require(:topic).permit(:title)
  end

end
