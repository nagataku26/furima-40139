FactoryBot.define do
  factory :item do
    item_name { '商品名' }
    item_description { '商品説明' }
    category_id { 2 }
    status_id { 2 }
    delivery_charge_id { 2 }
    prefecture_id { 2 }
    days_delivery_id { 2 }
    price { 5000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
