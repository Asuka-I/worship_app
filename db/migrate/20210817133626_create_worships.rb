class CreateWorships < ActiveRecord::Migration[6.1]
  def change
    create_table :worships do |t|
      t.string :category, null: false
      t.string :title, presence: true, length: { maximum: 50 }
      t.string :place, presence: true, length: { maximum: 50 }

      t.timestamps
    end
  end
end
