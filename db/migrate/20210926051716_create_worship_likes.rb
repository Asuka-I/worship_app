class CreateWorshipLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :worship_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :worship, null: false, foreign_key: true

      t.timestamps
    end
    add_index :worship_likes, [:user_id, :worship_id], unique: true
  end
end