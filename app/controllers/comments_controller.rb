class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
    redirect_to board_path(comment.board)
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    # user_idとboard_idも一緒に保存する。board_idはurlから取得
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
