class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_category, only: [:new, :create]

  #jsonで親の名前で検索し、紐づく小カテゴリーの配列を取得
  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  #jsonで子カテゴリーに紐づく孫カテゴリーの配列を取得
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    flash[:notice] = "ログイン済みユーザーのみ出品できます" unless user_signed_in?
    @item = Item.new
    @item.item_images.new
    @item.build_brand
  end

  def create
    @item = Item.new(item_params)
    @item.item_images.new
    if @item.save
      redirect_to root_path
    else
      render action: :new, alert: "出品できませんでした"
    end
  end
  
  private
  # 親カテゴリー
  def set_category
    @parents = Category.where(ancestry: nil)
  end
  
  def item_params
    params.require(:item).permit(
      :product_name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :day_to_ship_id, :price, item_images_attributes: [:src], brand_attributes: [:brand_name]
    ).merge(user_id: current_user.id)
  end
end