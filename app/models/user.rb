class User < ApplicationRecord
  has_many :worships, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :seals, dependent: :destroy
  # いいね関連
  has_many :worship_likes, dependent: :destroy
  has_many :seal_likes, dependent: :destroy
  has_many :liked_worships, through: :worship_likes, source: :worship
  has_many :liked_seals, through: :seal_likes, source: :seal
  # フォロー関連
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
