class BoardsController < ApplicationController
  skip_before_action :require_login, only: [:top, :index, :show]
  before_action :ensure_board, only: [:edit, :update, :destroy]
  require 'rspotify'
  RSpotify.authenticate(Rails.application.credentials.spotify[:client_id],
                        Rails.application.credentials.spotify[:client_secret])

  def top; end

  def index
    @pagy, @boards = pagy(Board.all.order(created_at: :desc), items: 12)
  end

  def search
    @tracks = RSpotify::Track.search(params[:search]).first(9) if params[:search].present?
  end

  def new
    @board = current_user.boards.new(track_params)
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to boards_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
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
      redirect_to @board, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_path, success: t('.success')
  end

  private

  def board_params
    params.require(:board).permit(:board_image, :title, :body, :song_title, :artist, :song_image, :song_player)
  end

  def track_params
    params.permit(:song_title, :artist, :song_image, :song_player)
  end

  def ensure_board
    @board = current_user.boards.find(params[:id])
  end
end
