class BoardsController < ApplicationController
  def top
  end

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
  end

  def update
  end

  def destroy
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end
end
