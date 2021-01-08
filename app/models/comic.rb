class Comic < ApplicationRecord

  belongs_to :category
  has_many :tag_maps, dependent: :destroy
  has_many :reviews, dependent: :destroy

  attachment :comic_image

end
s