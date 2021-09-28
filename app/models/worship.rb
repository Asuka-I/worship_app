class Worship < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :worship_likes, dependent: :destroy
  has_many :worship_liked_users, through: :worship_likes, source: :user

  mount_uploaders :images, ImageUploader

  delegate :name, to: :user, prefix: true, allow_nil: true

  def liked_worship_by?(user)
    worship_likes.any? { |worship_like| worship_like.user_id == user.id }
  end
end
