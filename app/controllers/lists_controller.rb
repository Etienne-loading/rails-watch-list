class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = finder
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'Restaurant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def finder
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
