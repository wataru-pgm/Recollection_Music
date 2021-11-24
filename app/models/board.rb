class Board < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 15 }
  validates :body, presence: true, length: { minimum: 5, maximum: 200 }
end
