class BookmarksController < ApplicationController
  # before_action :set_bookmark, only: [:edit, :show, :update, :destroy]
  before_action :set_bookmark, only: [:destroy]
  before_action :set_list, only: [:new, :create]


  # def index
  #   @bookmarks = Bookmark.all
  # end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end


  # def create
  #   @bookmark = Bookmark.new(bookmark_params)
  #   @bookmark.list = @list
  #   @bookmark.save
  #   redirect_to list_path(@list)
  # end




  def new
    @bookmark = Bookmark.new
  end

  # def edit
  # end

  # def show
  # end

  # def update
  #   if @bookmark.update(bookmark_params)
  #     redirect_to @bookmark
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
    # params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
