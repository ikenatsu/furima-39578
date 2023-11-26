class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  #   def move_to_index
  #     return if user_signed_in?

  #     redirect_to action: :index
  #   end

  private

  def item_params
    params.require(:item).permit(:item_name, :comment, :category_id, :condition_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_duration_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
