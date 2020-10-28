class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_category, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update]

  #jsonで親の名前で検索し、紐づく小カテゴリーの配列を取得
  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  #jsonで子カテゴリーに紐づく孫カテゴリーの配列を取得
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  # 商品一覧
  def index
    @parents = Category.where(ancestry: nil)
    # @item = Item.find(params[:id])
    @items = Item.all.order(created_at: :desc)
  end

  # 商品出品
  def new
    flash[:notice] = "ログイン済みユーザーのみ出品できます" unless user_signed_in?
    @item = Item.new
    @item_images = @item.item_images.build
    @item.build_brand
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = '出品に成功しました'
      redirect_to root_path
    else
      unless @item.item_images.present?
        @item.item_images.new
        render 'new'
      else
        render 'new'
      end
      # flash.now[:alert] = '出品に失敗しました'
      # render action: :new
      # redirect_to new_item_path,alert: '出品に失敗しました'
    end
  end

  # 商品情報編集
  def edit
    #カテゴリーデータ取得
    @grandchild_category = @item.category
    @child_category = @grandchild_category.parent 
    @category_parent = @child_category.parent

    #カテゴリー一覧を作成
    @category = Category.find(params[:id])
    # 紐づく孫カテゴリーの親（子カテゴリー）の一覧を配列で取得
    @category_children = @item.category.parent.parent.children
    # 紐づく孫カテゴリーの一覧を配列で取得
    @category_grandchildren = @item.category.parent.children

    if user_signed_in? && @item.user_id == current_user.id

    else
      redirect_to root_path, alert: "出品した商品ではありません"
    end

  end

  def update
    @parents = Category.where(ancestry: nil)
    if @item.update(item_params)
      flash[:notice] = "編集が完了しました"
      redirect_to root_path
    else
      render action: :edit, alert: "商品を更新できませんでした"
    end
  end
  

  private
  # 親カテゴリー
  def set_category
    @parents = Category.where(ancestry: nil)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :product_name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :day_to_ship_id, :price, item_images_attributes: [:src, :_destroy, :id], brand_attributes: [:brand_name, :id]
    ).merge(user_id: current_user.id)
  end
end