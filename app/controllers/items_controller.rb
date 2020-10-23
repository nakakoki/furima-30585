class ItemsController < ApplicationController
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
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :condition_id, :shipping_charge_id, :days_to_ship_id, :prefectures_id, :category_id, :price, :image).merge(user_id: current_user.id)
  end
end
