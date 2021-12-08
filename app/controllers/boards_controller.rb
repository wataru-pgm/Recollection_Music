class BoardsController < ApplicationController
  before_action :ensure_board, only: [:edit, :update, :destroy]
  require 'rspotify'
  RSpotify.authenticate("1569c25d55f2414988dc28a87070eaad", "57f597603979430a8c82434ac45247be")
  # (Rails.application.credentials.dig(:spotify, :key),
  #  Rails.application.credentials.dig(:spotify, :secret_key))

  def top; end

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
    if params[:search].present?
      @tracks = RSpotify::Track.search(params[:search]).first(5)
      @track = @tracks.find { |track| track.artists[0].name == (params[:search]) }
    end
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to @board
    else
      render :edit
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end

  def ensure_board
    @board = current_user.boards.find(params[:id])
  end
end
