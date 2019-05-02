class HomeController < ApplicationController
  def home
    @promo_pieces = (0...3).map do
      Piece.all.sample.uploaded_image.service_url
    end
  end
end
