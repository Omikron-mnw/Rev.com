class Comic < ApplicationRecord

  belongs_to :category
  has_many :tag_maps, dependent: :destroy
  has_many :reviews, dependent: :destroy

  attachment :comic_image

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :body, presence: true

  # レビュー平均
  def avg_rate
    unless self.reviews.empty?
      reviews.average(:rate).round(1).to_f
    else
      0.0
    end
  end

  def review_rate_percentage
    unless self.reviews.empty?
      reviews.average(:rate).round(1).to_f*100/5
    else
      0.0
    end
  end

end
