class CommentsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    if logged_in?
      @comment = current_user.comments.build(comment_params)
      @comment.save
      redirect_to board_path(@comment.board)
    else
      redirect_to login_path, danger: "ログインしてください"
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
    redirect_to board_path(@comment.board)
  end

  private

  def comment_params
    # user_idとboard_idも一緒に保存する。board_idはurlから取得
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
