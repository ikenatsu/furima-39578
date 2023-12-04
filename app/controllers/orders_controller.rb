class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    elsif @item.order.nil?
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      # @order = Order.create(order_params)
      @order_delivery = OrderDelivery.new
      @item = Item.find(params[:item_id])
    else
      redirect_to root_path
    end
  end

  # def new
  #   @order_delivery = OrderDelivery.new
  # end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  # def address_params
  #   params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  # end
end
