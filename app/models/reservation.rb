class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  has_many :reviews, dependent: :destroy

  scope :guest_reviews_search , -> (reservation_id,item_id){where(
    id: reservation_id,
    item_id: item_id
  ).first}

  scope :host_reviews_search , -> (reservation_id,item_id,guest_id){where(
   id: reservation_id,
   item_id: item_id,
   user_id: guest_id
  ).first}
end