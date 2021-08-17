class AddColumnsToWorships < ActiveRecord::Migration[6.1]
  def change
    add_column :worships, :content, :text
    add_column :worships, :date, :date
    add_column :worships, :image, :string
    add_column :worships, :rating, :float
    add_column :worships, :likes_count, :integer
  end
end
