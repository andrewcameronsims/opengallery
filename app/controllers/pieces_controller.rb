class PiecesController < ApplicationController
  def index
    @pieces = Piece.all.shuffle
    @urls = Painting.get_urls
  end

  def show
    @piece = Piece.find(params[:id])
    @artist = @piece.workshop.user
  end

  def new
    @piece = Piece.new
  end

  def edit
    @piece = Piece.find(params[:id])
  end

  def create
    @piece = Piece.new(piece_params)

    if @piece.save
      redirect_to @piece
    else
      render 'new'
    end
  end

  def update
    @piece = Piece.find(params[:id])

    if @piece.update(piece_params)
      redirect_to @piece
    else
      render 'edit'
    end
  end

  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy

    redirect_to pieces_path
  end

  private
    def piece_params
      params.require(:piece).permit(:name, :description, :price, :materials, :dimensions, :workshop_id)
    end
end
