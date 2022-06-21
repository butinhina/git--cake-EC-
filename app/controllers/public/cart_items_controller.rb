class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def new
    @cart_item = CartItem.new
  end

  def create
    @new_cart_item = CartItem.new(cart_item_params)
    if CartItem.find_by(item_id: params[:cart_item][:item_id]) #カートに入れた商品はすでにカートに追加済か？
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id]) #カート内のすでにある商品の情報取得
      @cart_item.amount = @cart_item.amount + @new_cart_item.amount #既にある情報に個数を合算
      @cart_item.update(amount:@cart_item.amount) #情報の更新　個数カラムのみ
      redirect_to public_cart_items_path
    else
      @new_cart_item.customer_id = current_customer.id #誰のカートか紐付け
      if @new_cart_item.save
        flash[:notice] = "#{@new_cart_item.item.name}をカートに追加しました。"
        redirect_to public_cart_items_path
      else
        flash[:alert] = "個数を選択してください"
        render 'index'
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end
 
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id,:customer_id,:amount)
  end
end
