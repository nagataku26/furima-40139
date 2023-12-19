class ItemsController < ApplicationController
  before_action :move_to_user_new, only: :new
  def index
    @items = Item.all.order('created_at DESC')

    @item_exists = @items.present?
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

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :status_id, :delivery_charge_id, :prefecture_id,
                                 :days_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_user_new
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
