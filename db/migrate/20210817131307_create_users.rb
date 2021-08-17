class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, default: "", null: false
      t.string :avatar
      t.text :introduce

      t.timestamps
    end
  end
end
