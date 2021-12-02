class AddAddressToWorships < ActiveRecord::Migration[6.1]
  def change
    add_column :worships, :address, :string
  end
end
