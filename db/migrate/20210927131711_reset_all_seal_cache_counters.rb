class ResetAllSealCacheCounters < ActiveRecord::Migration[6.1]
  def up
    Seal.find_each { |seal| Seal.reset_counters(seal.id, :likes_count) }
  end

  def down; end
end
