class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: currnet_user.id, board_id: @board.id)
    @likes.save
  end

  def destroy
  end

  private

  def set_board
    @board = Board.find_by(id: params[:board_id])
  end
end
