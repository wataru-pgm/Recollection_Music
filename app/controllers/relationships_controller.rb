class RelationshipsController < ApplicationController
  # フォローする
  def create
    # paramsでフォロワーを取得
    @other_user = User.find(params[:follower])
    # ログインしているユーザが@other_userをフォローする
    current_user.follow(@other_user)
  end

  # フォロー外す
  def destroy
    # ログインしているユーザの情報をrelationshipsテーブルのfollower_idを取得する
    @user = current_user.relationships.find(params[:id]).follower
    # ログインしているユーザがフォローを外す
    current_user.unfollow(params[:id])
  end
end
