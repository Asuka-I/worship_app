class AddColumnsToWorships < ActiveRecord::Migration[6.1]
  def change
    hange_table :worships, bulk: true do |t|
      t.text :content
      t.date :date
      t.string :image
      t.float :rating
      t.integer :likes_count
    end
  end
end
