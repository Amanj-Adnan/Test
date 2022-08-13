class AddAddressForOffices < ActiveRecord::Migration[6.1]
  def change
    add_column :offices , :address , :string
    add_column :offices , :location , :string

  end
end
