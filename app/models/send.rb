class Send < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :prefecture, presence: true

  with_options numericality: { other_than: 0 } do
    validates :prefecture_id
  end

  validates :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :postcode, :city, :block , presence: true
  validates :family_name_kanji, :first_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ぁ-んー－]+\z/}

end
