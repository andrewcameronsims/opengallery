# frozen_string_literal: true

class Piece < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :materials, presence: true
  validates :dimensions, presence: true
  validates :description, presence: true
  validates :tags, presence: true
  validates :uploaded_image, presence: true

  belongs_to :user, optional: true
  belongs_to :workshop

  has_one_attached :uploaded_image

  def self.tag_sort(user_tags)
    # Sort all pieces into three tiers: total match, partial match and no match between tags
    pieces_total_match = Piece.all.select { |p| p.tags.all? { |tag| user_tags.any? tag } }

    pieces_partial_match = Piece.all.select do |p|
      p.tags.any? { |tag| user_tags.any? tag } && !pieces_total_match.include?(p)
    end

    pieces_no_match = Piece.all.select do |p|
      !pieces_total_match.include?(p) && !pieces_partial_match.include?(p)
    end

    # Concatenate these tiers into the sorted array of pieces
    pieces_total_match + pieces_partial_match + pieces_no_match
  end

  def self.favourite_sort(piece_arr, user_id)
    # Takes an array of pieces and brings pieces by favourited artists to the top
    piece_arr.partition do |p|
      Follower.find_by(workshop_id: p.workshop.id, user_id: user_id)
    end.flatten
  end
end
