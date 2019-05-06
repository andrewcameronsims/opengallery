class Piece < ApplicationRecord

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
end
