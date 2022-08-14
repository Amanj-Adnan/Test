class DropWrokInAndFixWorkflow < ActiveRecord::Migration[6.1]
  def change
    add_reference :users , :user_workflow , index: true,:default => 0, :null => false
  end
end
