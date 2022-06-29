class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def customer_params
    params.require(:item).permit(:name, :image, :price, :introduction)
  end

end
