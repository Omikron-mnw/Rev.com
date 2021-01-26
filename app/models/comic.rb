class Comic < ApplicationRecord

  self.primary_key = "isbn" #<== API使用のため
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :tags, dependent: :destroy

  # バリデーション
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :category_id, presence: true

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

  # 検索
  ## User
  def Comic.search(search, user_or_comic, how_search)
    if user_or_comic == "2"
      if how_search == "1"
        Comic.where(['title LIKE ?', "%#{search}%"])
      elsif how_search == "2"
        Comic.where(['title LIKE ?', "%#{search}"])
      elsif how_search == "3"
        Comic.where(['title LIKE ?', "#{search}%"])
      elsif how_search == "4"
        Comic.where(['title LIKE ?', "#{search}"])
      else
        Comic.all
      end
    end
  end
  ## Admin
  # def self.search(search)
  #   return Comic.all unless search
  #   Comic.where(['title LIKE ?', "%#{search}%"])
  # end


end
