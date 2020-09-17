require 'rails_helper'

describe Address do
  describe '#create' do
    it "すべての項目を入力すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "family_name_kanjiが空では登録できないこと" do
      # it "is invalid without a family_name_kanji" do
        address = build(:address, family_name_kanji: nil)
        address.valid?
        expect(address.errors[:family_name_kanji]).to include("can't be blank")
      end
  
      it "family_name_kanjiが全角文字なら登録できること" do
      # it "is valid with a family_name_kanji that is double-byte character" do
        address = build(:address, family_name_kanji: "山田")
        expect(address).to be_valid
      end
  
      it "family_name_kanjiが半角文字では登録できないこと" do
      # it "is invalid with a family_name_kanji that is one-byte character" do
        address = build(:address, family_name_kanji: "yamada")
        address.valid?
        expect(address.errors[:family_name_kanji]).to include("is invalid")
      end
      
      it "first_name_kanjiが空では登録できないこと" do
      # it "is invalid without a first_name_kanji" do
        address = build(:address, first_name_kanji: nil)
        address.valid?
        expect(address.errors[:first_name_kanji]).to include("can't be blank")
      end
  
      it "first_name_kanjiが全角文字なら登録できること" do
      # it "is valid with a first_name_kanji that is double-byte character" do
        address = build(:address, first_name_kanji: "太郎")
        expect(address).to be_valid
      end
  
      it "first_name_kanjiが半角文字では登録できないこと" do
      # it "is invalid with a first_name_kanji that is one-byte character" do
        address = build(:address, first_name_kanji: "taro")
        address.valid?
        expect(address.errors[:first_name_kanji]).to include("is invalid")
      end
      
      it "family_name_kanaが空では登録できないこと" do
      # it "is invalid without a family_name_kana" do
        address = build(:address, family_name_kana: nil)
        address.valid?
        expect(address.errors[:family_name_kana]).to include("can't be blank")
      end
  
      it "family_name_kanaが全角文字なら登録できること" do
      # it "is valid with a family_name_kanna that is double-byte character" do
        address = build(:address, family_name_kana: "やまだ")
        expect(address).to be_valid
      end
  
      it "family_name_kanaが半角文字では登録できないこと" do
      # it "is invalid with a family_name_kana that is one-byte character" do
        address = build(:address, family_name_kana: "yamada")
        address.valid?
        expect(address.errors[:family_name_kana]).to include("is invalid")
      end
  
      it "first_name_kanaが空では登録できないこと" do
      # it "is invalid without a first_name_kana" do
        address = build(:address, first_name_kana: nil)
        address.valid?
        expect(address.errors[:first_name_kana]).to include("can't be blank")
      end
  
      it "first_name_kanaが全角文字なら登録できること" do
      # it "is valid with a family_name_kanna that is double-byte character" do
        address = build(:address, first_name_kana: "たろう")
        expect(address).to be_valid
      end
  
      it "first_name_kanaが半角文字では登録できないこと" do
      # it "is invalid with a first_name_kana that is one-byte character" do
        address = build(:address, first_name_kana: "taro")
        address.valid?
        expect(address.errors[:first_name_kana]).to include("is invalid")
      end

      it "postcodeが空では登録できないこと" do
      # it "is invalid without a postcode" do
        address = build(:address, postcode: nil)
        address.valid?
        expect(address.errors[:postcode]).to include("can't be blank")
      end

      it "prefecture_idが空では登録できないこと" do
      # it "is invalid without a prefecture_id" do
        address = build(:address, prefecture_id: nil)
        address.valid?
        expect(address.errors[:prefecture]).to include("can't be blank")
      end

      it "prefecture_idが0だと登録できないこと" do
      # it "is invalid with a prefecture_id that is 0" do
        address = build(:address, prefecture_id: 0)
        address.valid?
        expect(address.errors[:prefecture_id]).to include("must be other than 0")
      end

      it "prefecture_idが0以外だと登録できること" do
      # it "is valid with a prefecture_id that is other than 0" do
        address = build(:address, prefecture_id: 1)
        expect(address).to be_valid
      end

      it "cityが空では登録できないこと" do
      # it "is invalid without a city" do
        address = build(:address, city: nil)
        address.valid?
        expect(address.errors[:city]).to include("can't be blank")
      end

        it "blockが空では登録できないこと" do
        # it "is invalid without a block" do
          address = build(:address, block: nil)
          address.valid?
          expect(address.errors[:block]).to include("can't be blank")
        end
  end
end