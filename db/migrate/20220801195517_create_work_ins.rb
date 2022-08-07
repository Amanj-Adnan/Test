class CreateWorkIns < ActiveRecord::Migration[6.1]
  def change
    create_table :work_ins do |t|
      t.belongs_to :user
      t.belongs_to :user_workflow
      t.timestamps
    end
  end
end
