class Comment < ApplicationRecord
  belongs_to :worship
  belongs_to :user

  delegate :name, to: :user, prefix: true
end
