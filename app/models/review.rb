class Review < ApplicationRecord
    belongs_to :user
    belongs_to :product
    scope :ordered, -> { order(id: :desc) }
    broadcasts_to ->(review) { [review.product, "reviews"] }, inserts_by: :prepend
end
