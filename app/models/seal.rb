class Seal < ApplicationRecord
  belongs_to :user
  has_many :seal_likes, dependent: :destroy

  mount_uploaders :images, SealImageUploader

  delegate :name, to: :user, prefix: true, allow_nil: true
end
