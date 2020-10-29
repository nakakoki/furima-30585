FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    prefecture_id { '2' }
    city { '東京都' }
    address{ '青山1-1' }
    building_name { '柳ビル' }
    phone_number { '09012345678' }
  end
end