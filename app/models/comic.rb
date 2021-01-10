class Comic < ApplicationRecord

  belongs_to :category
  has_many :tag_maps, dependent: :destroy
  has_many :reviews, dependent: :destroy

  attachment :comic_image

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :body, presence: true

end
