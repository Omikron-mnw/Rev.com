class Tag < ApplicationRecord

  belongs_to :user
  belongs_to :comic

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


  # scope :search_comic,
  #   ->(name) {
  #     includes(tag: [tag_map: [review: [:comic]]]).where(
  #       "comics.name = ?", name).references(:comics)
  #   }

  scope :search_comic,->(name) {includes(tag: [review: [:comic]]).where("comics.title = ?", name).references(:comics)}


end
