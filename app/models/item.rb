class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :user
  belongs_to :brand, optional: true, dependent: :destroy
  accepts_nested_attributes_for :brand, allow_destroy: true
  has_one :purchase
  # belongs_to :category, optional: true
  
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :condition
belongs_to_active_hash :ShippingFee
belongs_to_active_hash :DayToShip
belongs_to_active_hash :prefecture

validates :item_image_ids, presence: { message: "は1枚以上選択してください。" }
validates :product_name, presence: { message: "を入力してください。" }
validates :description, presence: { message: "入力してください。" }
validates :category_id, presence: { message: "を選択してください。" }
validates :condition_id, presence: { message: "を選択してください。" }
validates :shipping_fee_id, presence: { message: "を選択してください。" }
validates :prefecture_id, presence: { message: "を選択してください。" }
validates :day_to_ship_id, presence: { message: "を選択してください。" }
validates :price, presence: { message: "を入力してください。" }
validates :user_id, presence: { message: "ログインしてください"}

validates :price, format: {with: /\A[0-9０-９]+\z/}
end