class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :move_to_index

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'orders/index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id || @item.purchase.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
