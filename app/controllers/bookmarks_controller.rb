class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)

    redirect_to [@topic.user, @topic] if @bookmark.save
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)

    redirect_to [@bookmark.topic, @bookmark] if @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    redirect_to user_path(current_user) if @bookmark.destroy
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
