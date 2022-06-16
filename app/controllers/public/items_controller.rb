class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end

  private
  def customer_params
    params.require(:item).permit(:name, :image, :price, :introduction)
  end

end
