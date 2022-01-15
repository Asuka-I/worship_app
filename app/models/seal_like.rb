class SealLike < ApplicationRecord
  belongs_to :user
  belongs_to :seal, counter_cache: :likes_count
  validates :user_id, uniqueness: {
    scope: :seal_id,
    message: "は同じ投稿に2回以上いいねはできません"
  }
end
