FactoryBot.define do
    factory :item do
      item_name {"Testitem"}
      main_category {"Outdoor"}
      sub_category {"Goods"}
      status {"A"}
      summary {"test"}
      address {"tokyo"}
      price {200}
      user_id {1}
      association :user
    end
end