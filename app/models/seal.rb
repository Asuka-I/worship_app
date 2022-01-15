class Seal < ApplicationRecord
  belongs_to :user
  has_many :seal_likes, dependent: :destroy
  has_many :seal_liked_users, through: :seal_likes, source: :user

  validates :category, presence: true
  validates :prefecture_id, presence: true
  validates :place, presence: true, length: { maximum: 10 }
  validates :date, presence: true

  mount_uploaders :images, SealImageUploader

  delegate :name, to: :user, prefix: true, allow_nil: true

  def liked_seal_by?(user)
    seal_likes.any? { |seal_like| seal_like.user_id == user.id }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
