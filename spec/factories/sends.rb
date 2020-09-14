FactoryBot.define do

  factory :send do
    family_name_kanji     {"山田"}
    first_name_kanji      {"太郎"}
    family_name_kana      {"やまだ"}
    first_name_kana       {"たろう"}
    postcode              {"555-5555"}
    prefecture_id         {5}
    city                  {"名古屋"}
    block                 {"中区栄3-13-20"}
    building              {"栄センタービル3F"}
    tel                   {"09055555555"}
    user_id               {5}
    user
  end

end
