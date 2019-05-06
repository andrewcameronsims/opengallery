class PiecesController < ApplicationController
  def index
    if current_user
      user_tags = current_user.tags
      pieces_total_match = Piece.find { |p| p.tags.all? { |tag| user_tags.any? tag } }
      pieces_partial_match = Piece.find do |p|
        p.tags.any? { |tag| user_tags.any? tag } && !pieces_total_match.include?(p)
      end
      pieces_no_match = Piece.find do |p|
        !pieces_total_match.include?(p) && !pieces_partial_match.include?(p)
      end
      @pieces = pieces_total_match + pieces_partial_match + pieces_no_match
    else
      @pieces = Piece.all.shuffle
    end
  end

  def show
    @piece = Piece.find(params[:id])
    @artist = @piece.workshop.user
    cookies.encrypted[:piece_id] = params[:id]
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
      params.require(:piece).permit(:name, :description, :price, :materials, :dimensions, :workshop_id, :uploaded_image, :tags => [])
    end
end
