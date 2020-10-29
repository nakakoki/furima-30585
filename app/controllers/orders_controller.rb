class OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render 'orders/index'
    end
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end