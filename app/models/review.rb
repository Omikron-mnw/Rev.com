class Review < ApplicationRecord

  belongs_to :user
  belongs_to :comic
  has_many :comments, dependent: :destroy

  # タグ機能
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    #古いタグを除く処理
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end
    #新しいタグを保存
    new_tags.each do |new|
      new_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_tag
    end
  end

  # いいね機能
  has_many :likes, dependent: :destroy
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

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
