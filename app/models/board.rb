class Board < ApplicationRecord
  has_one_attached :board_image

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes,    dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :title, presence: true, length: { minimum: 3, maximum: 20 }
  validates :body,  presence: true, length: { minimum: 5, maximum: 200 }
  validates :how_old, presence: true, numericality: { in: 0..65 }
end
