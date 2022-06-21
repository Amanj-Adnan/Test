class ChangeIntegarToDouble < ActiveRecord::Migration[6.1]
  def change
    add_column :leaves , :hourly_leave,:integer
  end
end
