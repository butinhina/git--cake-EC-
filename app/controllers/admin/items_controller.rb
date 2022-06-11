class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
    @item=Item.new
  end

  def new
  end

  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.permit(:id,:genre_id,:name,:introduction,:price,:is_active,:image_id)
  end

end
