FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(7)
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { password }
    password_confirmation { password }
    family_name_kanji     {"山田"}
    first_name_kanji      {"太郎"}
    family_name_kana      {"やまだ"}
    first_name_kana       {"たろう"}
    birthday              {"2020-12-31"}
  end

end