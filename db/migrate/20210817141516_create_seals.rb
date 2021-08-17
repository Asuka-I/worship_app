class CreateSeals < ActiveRecord::Migration[6.1]
  def change
    create_table :seals do |t|
      t.string :category, null:false
      t.string :title, presence: true, length: { maximum: 50 }
      t.string :place, presence: true, length: { maximum: 50 }
      t.date :date, null:false
      t.string :image
      t.integer :likes_count, default: 0

      t.timestamps
    end
  end
end
