class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index]
  
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

#   def move_to_index
#     return if user_signed_in?

#     redirect_to action: :index
#   end

  private

  def item_params
    params.require(:item).permit(:item_name, :comment, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_duration_id, :price, :image).merge(user_id: current_user.id)
  end
end
