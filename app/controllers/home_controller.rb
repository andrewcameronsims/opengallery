# frozen_string_literal: true

class HomeController < ApplicationController
  def home
    if current_user
      user_tags = current_user.tags
      @promo_pieces = Piece.tag_sort(user_tags)
    else
      @promo_pieces = Piece.all.sample(3)
    end
  end

  def about; end

  def contact; end
end
