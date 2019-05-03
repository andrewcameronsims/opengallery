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
    if current_user && current_user.artist?
      @piece = Piece.new
      @user = current_user
      @workshop = Workshop.find_by(user_id: @user.id)
    else
      redirect_to home_path
    end
  end

  def edit
    if current_user && current_user.artist?
      @piece = Piece.find(params[:id])
      @user = current_user
      @workshop = Workshop.find_by(user_id: @user.id)
    else
      redirect_to home_path
    end
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
      params.require(:piece).permit(:name, :description, :price, :materials, :dimensions, :workshop_id, :uploaded_image)
    end
end
