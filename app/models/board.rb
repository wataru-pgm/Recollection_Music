class Board < ApplicationRecord
  has_one_attached :board_image, dependent: :destroy

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes,    dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :title, presence: true, length: { minimum: 5, maximum: 15 }
  validates :body,  presence: true, length: { minimum: 5, maximum: 200 }
end
