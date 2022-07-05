class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  #マイページへのアクション
  def show
    @customer = current_customer
  end

  # 登録情報編集へのアクション
  def edit
    @customer = current_customer
  end

  # 登録情報の編集を保存するアクション
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to my_page_path
  end
  # 登録情報編集画面から退会ページを表示するアクション
  def unsubscribe
  end
  # 退会アクション
  def withdraw
    @customer=current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end



private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end


end
