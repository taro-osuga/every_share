FactoryBot.define do
    factory :reservation do
      start_date {"2020-06-24"}
      end_date {"2020-06-25"}
      price {100}
      total {200}
      association :user
      association :item
    end
end