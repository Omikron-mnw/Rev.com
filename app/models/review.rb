class Review < ApplicationRecord

  belongs_to :user
  belongs_to :comic
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


end
