class CreateSealLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :seal_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :seal, null: false, foreign_key: true

      t.timestamps
    end
    add_index :seal_likes, [:user_id, :seal_id], unique: true
  end
end
