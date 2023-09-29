class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
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
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
       render 'edit'
    end
  end
  def edit
    if @item.user_id == current_user.id 
    else
      redirect_to root_path
    end
  end
  def show
  end
  def destroy
    if @item.user_id == current_user.id
    else
      @item.user_id != current_user.id
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :condition_id, :shipment_id, :prefecture_id, :cost_id, :content, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end

