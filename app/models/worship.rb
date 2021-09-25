class Worship < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :worship_likes, dependent: :destroy

  mount_uploaders :images, ImageUploader

  delegate :name, to: :user, prefix: true, allow_nil: true
end
