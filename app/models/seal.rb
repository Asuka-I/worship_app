class Seal < ApplicationRecord
  belongs_to :user

  mount_uploaders :images, SealImageUploader

  delegate :name, to: :user, prefix: true, allow_nil: true
end
