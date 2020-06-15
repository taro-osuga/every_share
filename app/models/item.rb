class Item < ApplicationRecord
    belong_to :user

    validates :main_category, presence: true
    validates :sub_category, presence: true
    validates :status, presence: true
end
