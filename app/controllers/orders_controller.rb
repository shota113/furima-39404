class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id != @item.user_id 
    else
      redirect_to root_path
    end
  end
  def create
  end
end
