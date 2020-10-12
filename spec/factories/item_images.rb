FactoryBot.define do
  factory :item_image do
    src   { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.png"), 'image/png') }
    association :item
  end
end