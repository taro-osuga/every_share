class Item < ApplicationRecord
    belongs_to :user
    has_many :photos

    validates :main_category, presence: true
    validates :sub_category, presence: true
    validates :status, presence: true
end
