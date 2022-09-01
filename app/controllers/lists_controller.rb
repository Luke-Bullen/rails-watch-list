class ListsController < ApplicationController
  # before_action :set_list, only: [:edit, :show, :update, :destroy]
  before_action :set_list, only: [:show, :destroy]
  # new and create list are in the bookmark controller


  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def new
    @list = List.new
  end

  # def edit
  # end

  def show
    @bookmark = Bookmark.new
  end

  # def update
  #   if @list.update(list_params)
  #     redirect_to @list
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
