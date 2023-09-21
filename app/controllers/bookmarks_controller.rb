class BookmarksController < ApplicationController
  def new
    # list_id is the reference id found in the bookmark table
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(create_params)
    @bookmark.list_id = @list.id
    if @bookmark.save
      redirect_to list_path(@list.id), notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
    # @bookmark = @list.bookmarks.find(params[:id])
    @bookmark.destroy

    redirect_to root_path
  end

  private

  def create_params
    # movie_id needs to be permitted
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
