class Comic < ApplicationRecord

  self.primary_key = "isbn" #<== API使用のため
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :tags, dependent: :destroy

  # バリデーション
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :publisher, presence: true

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
