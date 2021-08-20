class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :name, null: false
      t.string :avatar
      t.text :introduce
    end
  end
end
