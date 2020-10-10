require 'rails_helper'

describe Item do
  describe "#create" do

    before do
      @user = FactoryBot.create(:user)
    end

    it "すべての項目を入力すれば出品できること" do
      item = build(:item)
      item.valid?
      expect(item).to be_valid
    end

    # it "item_imageが0枚では出品できないこと" do
    #   item = build(:item, item_image_ids: [])
    #   item.valid?
    #   expect(item.errors[:item_image_ids]).to include("は1枚以上選択してください。")
    # end

    it "product_nameが空では出品できないこと" do
      item = build(:item, product_name: nil)
      item.valid?
      expect(item.errors[:product_name]).to include("を入力してください。")
    end

    it "descriptionが空では出品できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("入力してください。")
    end

    it "category_idが空では出品できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を選択してください。")
    end

    it "condition_idが空では出品できないこと" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition_id]).to include("を選択してください。")
    end

    it "shipping_fee_idが空では出品できないこと" do
      item = build(:item, shipping_fee_id: nil)
      item.valid?
      expect(item.errors[:shipping_fee_id]).to include("を選択してください。")
    end

    it "prefecture_idが空では出品できないこと" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を選択してください。")
    end

    it "day_to_ship_idが空では出品できないこと" do
      item = build(:item, day_to_ship_id: nil)
      item.valid?
      expect(item.errors[:day_to_ship_id]).to include("を選択してください。")
    end

    it "priceが空では出品できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください。")
    end

    it "brand_idが空でも出品できること" do
      item = build(:item, brand_id: nil)
      expect(item).to be_valid
    end

    it "user_idが空では出品できないこと" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("ログインしてください")
    end


    
  end
end