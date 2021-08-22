class AddColumnsToWorships < ActiveRecord::Migration[6.1]
  def change
    change_table :worships, bulk: true do |t|
      t.text :content
      t.date :date
      t.string :image
      t.float :rating
      t.integer :likes_count
      t.integer :user_id
    end
  end
end
