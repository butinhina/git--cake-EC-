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
  end

  def complete
  end

  def index
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
# redirect_to orders_confirm_path