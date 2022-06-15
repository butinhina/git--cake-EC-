class Admin::HomesController < ApplicationController
  def top
    @orders=Order.all
  end

 


  private
  def genre_params
    params.require(:orde).permit(:first_name, :last_name, :amount, :create_at, :status)
  end
end
