class Product < ApplicationRecord
    belongs_to :company
    has_many_attached :pictures

    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews

    default_scope -> { order(created_at: :desc) }

    paginates_per 10

    def display_pictures
        pictures.variable? ? pictures.variant(resize_to_limit: [500, 500]) :pictures
    end
end
