class Worship < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :user

  has_many :comments

  delegate :name, to: :user, prefix: true, allow_nil: true
end
