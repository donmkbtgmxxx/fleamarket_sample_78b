require 'rails_helper'

describe Send do
  describe '#create' do
    it "すべての項目を入力すれば登録できること" do
      send = build(:send)
      expect(send).to be_valid
    end

    it "family_name_kanjiが空では登録できないこと" do
      # it "is invalid without a family_name_kanji" do
        send = build(:send, family_name_kanji: nil)
        send.valid?
        expect(send.errors[:family_name_kanji]).to include("can't be blank")
      end
  
      it "family_name_kanjiが全角文字なら登録できること" do
      # it "is valid with a family_name_kanji that is double-byte character" do
        send = build(:send, family_name_kanji: "山田")
        expect(send).to be_valid
      end
  
      it "family_name_kanjiが半角文字では登録できないこと" do
      # it "is invalid with a family_name_kanji that is one-byte character" do
        send = build(:send, family_name_kanji: "yamada")
        send.valid?
        expect(send.errors[:family_name_kanji]).to include("is invalid")
      end
      
      it "first_name_kanjiが空では登録できないこと" do
      # it "is invalid without a first_name_kanji" do
        send = build(:send, first_name_kanji: nil)
        send.valid?
        expect(send.errors[:first_name_kanji]).to include("can't be blank")
      end
  
      it "first_name_kanjiが全角文字なら登録できること" do
      # it "is valid with a first_name_kanji that is double-byte character" do
        send = build(:send, first_name_kanji: "太郎")
        expect(send).to be_valid
      end
  
      it "first_name_kanjiが半角文字では登録できないこと" do
      # it "is invalid with a first_name_kanji that is one-byte character" do
        send = build(:send, first_name_kanji: "taro")
        send.valid?
        expect(send.errors[:first_name_kanji]).to include("is invalid")
      end
      
      it "family_name_kanaが空では登録できないこと" do
      # it "is invalid without a family_name_kana" do
        send = build(:send, family_name_kana: nil)
        send.valid?
        expect(send.errors[:family_name_kana]).to include("can't be blank")
      end
  
      it "family_name_kanaが全角文字なら登録できること" do
      # it "is valid with a family_name_kanna that is double-byte character" do
        send = build(:send, family_name_kana: "やまだ")
        expect(send).to be_valid
      end
  
      it "family_name_kanaが半角文字では登録できないこと" do
      # it "is invalid with a family_name_kana that is one-byte character" do
        send = build(:send, family_name_kana: "yamada")
        send.valid?
        expect(send.errors[:family_name_kana]).to include("is invalid")
      end
  
      it "first_name_kanaが空では登録できないこと" do
      # it "is invalid without a first_name_kana" do
        send = build(:send, first_name_kana: nil)
        send.valid?
        expect(send.errors[:first_name_kana]).to include("can't be blank")
      end
  
      it "first_name_kanaが全角文字なら登録できること" do
      # it "is valid with a family_name_kanna that is double-byte character" do
        send = build(:send, first_name_kana: "たろう")
        expect(send).to be_valid
      end
  
      it "first_name_kanaが半角文字では登録できないこと" do
      # it "is invalid with a first_name_kana that is one-byte character" do
        send = build(:send, first_name_kana: "taro")
        send.valid?
        expect(send.errors[:first_name_kana]).to include("is invalid")
      end

      it "postcodeが空では登録できないこと" do
      # it "is invalid without a postcode" do
        send = build(:send, postcode: nil)
        send.valid?
        expect(send.errors[:postcode]).to include("can't be blank")
      end

      it "prefecture_idが空では登録できないこと" do
      # it "is invalid without a prefecture_id" do
        send = build(:send, prefecture_id: nil)
        send.valid?
        expect(send.errors[:prefecture]).to include("can't be blank")
      end

      it "prefecture_idが0だと登録できないこと" do
      # it "is invalid with a prefecture_id that is 0" do
        send = build(:send, prefecture_id: 0)
        send.valid?
        expect(send.errors[:prefecture_id]).to include("must be other than 0")
      end

      it "prefecture_idが0以外だと登録できること" do
      # it "is valid with a prefecture_id that is other than 0" do
        send = build(:send, prefecture_id: 1)
        expect(send).to be_valid
      end

      it "cityが空では登録できないこと" do
      # it "is invalid without a city" do
        send = build(:send, city: nil)
        send.valid?
        expect(send.errors[:city]).to include("can't be blank")
      end

        it "blockが空では登録できないこと" do
        # it "is invalid without a block" do
          send = build(:send, block: nil)
          send.valid?
          expect(send.errors[:block]).to include("can't be blank")
        end
  end
end
