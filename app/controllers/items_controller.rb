class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    flash[:notice] = "ログイン済みユーザーのみ出品できます" unless user_signed_in?
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, alert: "出品できませんでした"
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(
      :product_name, :description, :category_id, :brand_id, :condition_id, :shipping_fee_id, :prefecture_id, :day_to_ship_id, :price, item_images_attributes: [:src]
    ).merge(user_id: current_user.id)
  end
end
