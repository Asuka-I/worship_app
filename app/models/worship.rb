class Worship < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :user

  delegate :name, to: :user, prefix: true, allow_nil: true

end
