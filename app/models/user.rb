class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birth_year_id, :birth_month_id, :birth_day_id ,presence: true
end
