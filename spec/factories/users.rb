FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name_kanji     {"山田"}
    first_name_kanji      {"太郎"}
    family_name_kana      {"やまだ"}
    first_name_kana       {"たろう"}
    birth_year_id         {"2020"}
    birth_month_id        {"12"}
    birth_day_id          {"31"}
  end

end