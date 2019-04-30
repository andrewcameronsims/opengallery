class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  has_one_attached :uploaded_image
end
