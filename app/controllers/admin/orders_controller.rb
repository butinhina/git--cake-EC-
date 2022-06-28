class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @total = 0
  end

  def update
  end
end
