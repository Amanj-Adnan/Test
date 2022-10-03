class AddLineManagerId < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :line_manager, index: true ,:default => 0
  end
end
