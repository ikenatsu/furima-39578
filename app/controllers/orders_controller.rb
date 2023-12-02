class OrdersController < ApplicationController
  # before_action :authenticate_user!, except: :index

  def index
    # @order = Order.create(order_params)
    @order_delivery = OrderDelivery.new
    @item = Item.find(params[:item_id])
  end

  # def new
  #   @order_delivery = OrderDelivery.new
  # end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    # params.require(:order_delivery).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item)
    params.require(:order_delivery).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # def address_params
  #   params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  # end



end
