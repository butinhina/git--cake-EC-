class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer = Customer.new
  end

  def index
  end

  private
  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status)
  end
end
