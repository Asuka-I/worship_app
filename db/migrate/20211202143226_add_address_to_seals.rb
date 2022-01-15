class AddAddressToSeals < ActiveRecord::Migration[6.1]
  def change
    add_column :seals, :address, :string
  end
end
