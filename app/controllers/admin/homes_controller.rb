class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders=Order.page(params[:page])
  end




  private
  # def order_params
  #   params.require(:order).permit(:first_name, :last_name, :amount, :create_at, :status)
  # end
end
