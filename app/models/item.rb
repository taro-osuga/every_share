class Item < ApplicationRecord
    belongs_to :user
    has_many :photos

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
end
