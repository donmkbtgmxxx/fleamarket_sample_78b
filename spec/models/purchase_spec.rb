require 'rails_helper'

describe Purchase do
  describe '#create' do
    it "すべての項目を入力すれば登録できること" do
    # it "is valid with a user_id, item_id" do
      purchase = build(:purchase)
      expect(purchase).to be_valid
    end

    it "user_idが空では登録できないこと" do
    # it "is invalid without a user_id" do
      purchase = build(:purchase, user_id: nil)
      purchase.valid?
      expect(purchase.errors[:user_id]).to include("を入力してください")
    end

    it "item_idが空では登録できないこと" do
      # it "is invalid without a item_id" do
        purchase = build(:purchase, item_id: nil)
        purchase.valid?
        expect(purchase.errors[:item_id]).to include("を入力してください")
      end
  end
end