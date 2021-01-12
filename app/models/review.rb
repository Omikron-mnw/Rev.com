class Review < ApplicationRecord

  belongs_to :user
  belongs_to :comic
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # バリデーション
  validates :comic_id, presence: true
  validates :user_id, presence: true
  validates :review, presence: true
  # 評価機能のバリデーション
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

end
