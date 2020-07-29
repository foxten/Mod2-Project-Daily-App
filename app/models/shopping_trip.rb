class ShoppingTrip < ApplicationRecord
    belongs_to :user
    validates :date, presence: true
    validates :receipt_total, presence: true
end

