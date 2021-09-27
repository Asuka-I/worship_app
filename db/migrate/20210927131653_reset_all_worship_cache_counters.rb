class ResetAllWorshipCacheCounters < ActiveRecord::Migration[6.1]
  def up
    Worship.find_each { |worship| Worship.reset_counters(worship.id, :likes_count) }
  end

  def down
  end
end
