class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(3)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id), notice: 'You have created item successfully.'
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.find(@item.genre_id)
  end

  def edit
  end

  def update
  end


  private
  def item_params
    params.require(:item).permit(:image_id,:name,:introduction,:price)
  end

end
