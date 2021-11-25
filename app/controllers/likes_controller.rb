class LikesController < ApplicationController
  before_action :set_board
  def create
    @like = Like.new(user_id: current_user.id, board_id: @board.id)
    @like.save
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, board_id: @board.id)
    @like.destroy
  end

  private

  def set_board
    @board = Board.find_by(id: params[:board_id])
  end
end
