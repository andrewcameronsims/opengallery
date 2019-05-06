class Piece < ApplicationRecord
  serialize :tags, Array

  belongs_to :user, optional: true
  belongs_to :workshop

  has_one_attached :uploaded_image
end
