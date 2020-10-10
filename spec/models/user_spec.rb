require 'rails_helper'

describe User do
  describe '#create' do

    it "すべての項目を入力すれば登録できること" do
    # it "is valid with a nickname, email, password, password_confirmation, family_name_kanji, first_name_kanji, family_name_kana, first_name_kana, birth_year_id, birth_month_id, birth_day_id" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
    # it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailが空では登録できないこと" do
    # it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したemailが存在する場合登録できないこと" do
    # it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが空では登録できないこと" do
    # it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
    # it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end


    it "passwordが7文字以上で登録できること" do
    # it "is valid with a password that has more than 7 characters" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      expect(user).to be_valid
    end
  
    it "passwordが6文字以下では登録できないこと" do
    # it "is invalid with a password that has less than 6 characters" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "family_name_kanjiが空では登録できないこと" do
    # it "is invalid without a family_name_kanji" do
      user = build(:user, family_name_kanji: nil)
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("は不正な値です")
    end

    it "family_name_kanjiが全角文字なら登録できること" do
    # it "is valid with a family_name_kanji that is double-byte character" do
      user = build(:user, family_name_kanji: "山田")
      expect(user).to be_valid
    end

    it "family_name_kanjiが半角文字では登録できないこと" do
    # it "is invalid with a family_name_kanji that is one-byte character" do
      user = build(:user, family_name_kanji: "yamada")
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("は不正な値です")
    end
    
    it "first_name_kanjiが空では登録できないこと" do
    # it "is invalid without a first_name_kanji" do
      user = build(:user, first_name_kanji: nil)
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("は不正な値です")
    end

    it "first_name_kanjiが全角文字なら登録できること" do
    # it "is valid with a first_name_kanji that is double-byte character" do
      user = build(:user, first_name_kanji: "太郎")
      expect(user).to be_valid
    end

    it "first_name_kanjiが半角文字では登録できないこと" do
    # it "is invalid with a first_name_kanji that is one-byte character" do
      user = build(:user, first_name_kanji: "taro")
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("は不正な値です")
    end
    
    it "family_name_kanaが空では登録できないこと" do
    # it "is invalid without a family_name_kana" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "family_name_kanaが全角文字なら登録できること" do
    # it "is valid with a family_name_kanna that is double-byte character" do
      user = build(:user, family_name_kana: "やまだ")
      expect(user).to be_valid
    end

    it "family_name_kanaが半角文字では登録できないこと" do
    # it "is invalid with a family_name_kana that is one-byte character" do
      user = build(:user, family_name_kana: "yamada")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaが空では登録できないこと" do
    # it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaが全角文字なら登録できること" do
    # it "is valid with a family_name_kanna that is double-byte character" do
      user = build(:user, first_name_kana: "たろう")
      expect(user).to be_valid
    end

    it "first_name_kanaが半角文字では登録できないこと" do
    # it "is invalid with a first_name_kana that is one-byte character" do
      user = build(:user, first_name_kana: "taro")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "birthdayが空では登録できないこと" do
    # it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
  end
end