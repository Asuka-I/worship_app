class WorshipLike < ApplicationRecord
  belongs_to :user
  belongs_to :worship, counter_cache: :likes_count
  validates :user_id, uniqueness: {
    scope: :worship_id,
    message: "は同じ投稿に2回以上いいねはできません"
  }
end
