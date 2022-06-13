class Public::CustomersController < ApplicationController
  def withdraw
    @customer=current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def show
  end




private
  def customer_params
    params.require(:cusromer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end


end
