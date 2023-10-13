class OrdersController < ApplicationController
  
  def index
    @form = Form.new
    @item = Item.find(params[:item_id])

    if user_signed_in? && current_user.id != @item.user_id
     
    else
      redirect_to root_path
    end
  end

  def create
    @form = Form.new(form_params)
    @item = Item.find(params[:item_id])
    if @form.valid?
      pay_item
      @form.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def form_params
    params.require(:form).permit(:postcode, :prefecture_id, :city, :street_number, :building_name, :tel).merge(user_id: current_user.id, item: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_d74560821b84f20d7f3cd3a9"
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end
end
