FactoryBot.define do
  factory :item do
    product_name       {"test"}
    description        {"testetstetst"}
    category_id        {5}
    brand_id           {"test"}
    condition_id       {5}
    shipping_fee_id    {5}
    prefecture_id      {5}
    day_to_ship_id     {5}
    price              {"1000"}
    user { FactoryBot.create(:user)}


    after(:build) do |item|
      item.item_images << FactoryBot.build(:item_image, item: item)
    end
    
    trait :with_picture do
      src   { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.png"), 'image/png') }
     end
  end
end