class CreateLeaveRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :leave_requests do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.references :line_manager, foreign_key: { to_table: 'users' }
      t.references :super_user, foreign_key: {to_table: 'super_users'}
      t.date :application_date
      t.datetime :leave_start_date
      t.datetime :leave_end_date
      t.string :leave_type
      t.string :pre_approve
      t.string :approve
      t.string :reason , default: nil
      t.string :certificate , default: nil

      t.timestamps
    end
  end
end
