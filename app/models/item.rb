class Item < ApplicationRecord
    
    belongs_to :user
    has_many :photos, dependent: :destroy
    has_many :reservations, dependent: :destroy

    has_many :guest_reviews, dependent: :destroy
    has_many :host_reviews, dependent: :destroy
    has_many :reviews, dependent: :destroy

    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    validates :main_category, presence: true
    validates :sub_category, presence: true
    validates :status, presence: true

    def cover_photo(size)
      if self.photos.length > 0
        self.photos[0].image.url(size)
      else
        "blank.jpg"
      end
    end

    def average_rating
      guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
    end
end
