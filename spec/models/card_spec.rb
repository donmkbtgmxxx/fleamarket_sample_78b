require 'rails_helper'

describe Card do
  describe '#create' do
    it "すべての項目を入力すれば登録できること" do
    # it "is valid with a customer_id, card_id, user_id" do
      card = build(:card)
      expect(card).to be_valid
    end

    it "customer_idが空では登録できないこと" do
    # it "is invalid without a customer_id" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end

    it "card_idが空では登録できないこと" do
      # it "is invalid without a card_id" do
        card = build(:card, card_id: nil)
        card.valid?
        expect(card.errors[:card_id]).to include("を入力してください")
      end
  end
end