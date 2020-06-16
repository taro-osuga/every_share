class Item < ApplicationRecord
    belongs_to :user

    validates :main_category, presence: true
    validates :sub_category, presence: true
    validates :status, presence: true
end
