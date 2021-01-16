class Tag < ApplicationRecord

  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :reviews, through: :tag_maps

  # scope :search_comic,
  #   ->(name) {
  #     includes(tag: [tag_map: [review: [:comic]]]).where(
  #       "comics.name = ?", name).references(:comics)
  #   }

  scope :search_comic,->(name) {includes(tag: [review: [:comic]]).where("comics.title = ?", name).references(:comics)}


end
