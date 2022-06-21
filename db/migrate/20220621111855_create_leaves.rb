class CreateLeaves < ActiveRecord::Migration[6.1]
  def change
    create_table :leaves do |t|
      t.belongs_to :user
      t.integer :annual_leave
      t.integer :sick_leave
      t.integer :maternity_leave
      t.integer :marriage_leave
      t.integer :paternity_leave
      t.integer :bereavement_leave
      t.integer :compensatory_off_leave
      t.integer :loss_of_pay_leave
      t.timestamps
    end
  end
end
