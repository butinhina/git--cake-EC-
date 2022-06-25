class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    # @customer = Customer.new
  end

  def confirm
    # binding.pry
    @order=Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    # binding.pry
    elsif params[:order][:select_address] == "1"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
        # binding.pry
    elsif params[:order][:select_address] == "2"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    end
    @cart_items = current_customer.cart_items
    @total = 0
  end
  def create
    @order = Order.new(order_params)
    @order.save
    # binding.pry
    current_customer.cart_items.each do |cart_item|  #カートの商品を1つずつ取り出しループ
      @order_detail = OrderDetail.new  #初期化宣言
      @order_detail.item_id = cart_item.item_id #商品idを注文商品idに代入
      @order_detail.amount = cart_item.amount #商品の個数を注文商品の個数に代入
      @order_detail.price = (cart_item.item.price * 1.1).floor #商品の税込み価格を注文商品の価格に代入
      @order_detail.order_id = @order.id #注文商品に注文idを紐付け
      @order_detail.save #注文商品を保存
      # binding.pry
    end #ループ終わり
    # binding.pry
      current_customer.cart_items.destroy_all #カートの中身を削除
      redirect_to orders_complete_path #注文完了画面に遷移
  end

  def complete
  end

  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @total = 0
    # @cart_items = current_customer.cart_items
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :customer_id)
  end

end
# redirect_to orders_confirm_path