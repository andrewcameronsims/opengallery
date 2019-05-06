class Piece < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :workshop

  has_one_attached :uploaded_image
end
