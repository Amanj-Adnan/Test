class DropWrokInAndFixWorkflow < ActiveRecord::Migration[6.1]
  def change
    drop_table :work_ins
    add_reference :users , :user_workflow , index: true,:default => 0, :null => false
  end
end
