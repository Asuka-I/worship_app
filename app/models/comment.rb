class Comment < ApplicationRecord
  belongs_to :worship
  belongs_to :user

  validates :content, presence: true, length: { maximum: 200 }

  delegate :name, to: :user, prefix: true
end
