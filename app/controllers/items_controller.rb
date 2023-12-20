class ItemsController < ApplicationController
  before_action :move_to_user_new, only: :new
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order('created_at DESC')

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

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to user_signed_in? ? root_path : new_user_session_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
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

  def item_find
    @item = Item.find(params[:id])
  end
end
