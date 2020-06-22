class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  has_many :reviews, dependent: :destroy
end
