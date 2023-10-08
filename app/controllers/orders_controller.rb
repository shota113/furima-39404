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
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def form_params
    params.require(:form).permit(:postcode, :prefecture_id, :city, :street_number, :building_name, :tel).merge(user_id: current_user.id)
  end
end
