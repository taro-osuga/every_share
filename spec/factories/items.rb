FactoryBot.define do
    factory :item do
      item_name {"Testitem"}
      main_category {"アウトドア"}
      sub_category {"グッズ"}
      status {"綺麗"}
      summary {"test"}
      address {"tokyo"}
      price {200}
      user_id {1}
      association :user
    end
end