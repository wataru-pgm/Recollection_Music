class BoardsController < ApplicationController
  skip_before_action :require_login, only: [:top, :index, :show]
  before_action :ensure_board, only: [:edit, :update, :destroy]
  require 'rspotify'
  RSpotify.authenticate(Rails.application.credentials.dig(:spotify, :client_id),
                        Rails.application.credentials.dig(:spotify, :client_secret))

  def top; end

  def index
    @pagy, @boards = pagy(Board.includes(:user).with_attached_board_image.order(created_at: :desc), items: 12)
  end

  def search
    @tracks = RSpotify::Track.search(params[:search]).first(9) if params[:search].present?
  end

  def recommend
    @board = Board.last(params[:id])
    age = current_user.birthday.strftime("%Y").to_i + @board.how_old
    @recommend_tracks = RSpotify::Track.search("genre:j-pop" + " " + "year:#{age}" + " " + "label:sony").first(6)
  end

  def new
    @board = current_user.boards.new(track_params)
    session[:recommend] = params[:recommend]
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      if current_user.birthday.present? && session[:recommend].nil?
        redirect_to recommend_boards_path, success: t('.success')
      elsif current_user.birthday.nil? || session[:recommend].present?
        session[:recommend].clear
        redirect_to boards_path, success: t('.success')
      end
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
    params.require(:board).permit(:board_image, :title, :body, :how_old, :song_title, :artist, :song_image,
                                  :song_player)
  end

  def track_params
    params.permit(:song_title, :artist, :song_image, :song_player)
  end

  def ensure_board
    @board = current_user.boards.find(params[:id])
  end
end
