class AddColumnsToWorships < ActiveRecord::Migration[6.1]
  def change
    change_table :worships, bulk: true do |t|
      t.text :content
      t.date :date
      t.json :images
      t.float :rating
      t.integer :likes_count
    end
  end
end
