class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  #フォロー機能
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, class_name: 'Relationship',foreign_key: 'follow_id'
  

  attachment :profile_image

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

end
