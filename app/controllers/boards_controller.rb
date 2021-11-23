class BoardsController < ApplicationController
  before_action :ensure_board, only: [:edit, :update, :destroy]

  def top; end

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
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
    @comment = Comment.new            # コメントのインスタンス作成
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
