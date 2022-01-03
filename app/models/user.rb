class User < ApplicationRecord
  authenticates_with_sorcery!

  # twitterログイン
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_boards, through: :likes, source: :board
  # フォローしている
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  # フォローされている
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :relationships, source: :user

  validates :name, presence: true, length: { minimum: 2, maximum: 15 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  # フォローする
  def follow(other_user)
    # 自分自身はフォローできないようにする
    return if self == other_user

    relationships.find_or_create_by!(follower: other_user)
  end

  # フォローしているかを確認する
  def following?(user)
    followings.include?(user)
  end

  # フォローを解除する
  def unfollow(relationship_id)
    relationships.find(relationship_id).destroy!
  end
end
