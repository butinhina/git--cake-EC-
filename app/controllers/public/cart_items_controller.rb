class Public::CartItemsController < ApplicationController
  def new
    @cart_item = CartItem.new
  end

  def create
    @new_cart_item = CartItem.new(cart_item_params)
    if CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount = @cart_item.amount + @new_cart_item.amount
      @cart_item.update(amount:@cart_item.amount)
      redirect_to cart_items_path
    else
      if @new_cart_item.save
      redirect_to cart_items_path
      else
      render template: "public/items/show"
      end
    end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end
end
