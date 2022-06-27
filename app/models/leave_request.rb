class LeaveRequest < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :line_manager , class_name: 'User'
  belongs_to :hr_officer , class_name: 'User'

  validates :user_id,:hr_officer_id,:line_manager_id,:leave_end_date,
            :leave_start_date,:leave_type, presence: true
end
