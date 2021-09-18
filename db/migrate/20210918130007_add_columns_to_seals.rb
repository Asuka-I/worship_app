class AddColumnsToSeals < ActiveRecord::Migration[6.1]
  def change
    add_reference :seals, :user, null: false, foreign_key: true
  end
end
