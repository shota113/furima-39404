class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @form = Form.new

    if current_user.id == @item.user_id && @item.order.nil?
     render 'index'
    else
      redirect_to root_path
    end
  end

  def create
    @form = Form.new(form_params)
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

  def set_item
    @item = Item.find(params[:id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end
end
