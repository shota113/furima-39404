class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def update
  #   @item = Item.find(params[:id])
  #   if @item.update(item_params)
  #     redirect_to item_path(@item)
  #   else
  #      render 'edit'
  #   end
  end
  # def edit
  #   @item = Item.find(params[:id])
  # end
  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :condition_id, :shipment_id, :prefecture_id, :cost_id, :content, :image).merge(user_id: current_user.id)
  end
end

