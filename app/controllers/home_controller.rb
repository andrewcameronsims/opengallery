class HomeController < ApplicationController
  def home
    @promo_pieces = Piece.all.shuffle[0..2]
  end
end
