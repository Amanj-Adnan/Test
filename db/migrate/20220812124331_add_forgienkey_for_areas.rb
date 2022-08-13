class AddForgienkeyForAreas < ActiveRecord::Migration[6.1]
  def change
    add_reference :cities , :country, index: true, :null => false
    add_reference :offices , :city, index: true, :null => false
  end
end
