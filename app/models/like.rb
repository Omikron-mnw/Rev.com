class Like < ApplicationRecord

  belongs_to :review
  belongs_to :user

  def liked_by?(user)
    likes.where(user_id: user_id).exists?
  end

end
