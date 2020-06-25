FactoryBot.define do
    factory :review do
      comment {"test"}
      star {2}
      reservation_id {1}
      type {"GuestReview"}
      association :reservation
    end
end