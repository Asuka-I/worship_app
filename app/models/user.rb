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
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower
  # フォロワー関連
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
