class LeaveRequest < ApplicationRecord
  include AASM
  belongs_to :user, class_name: 'User'
  belongs_to :line_manager , class_name: 'User'
  belongs_to :hr_officer , class_name: 'User'

  validates :user_id,:hr_officer_id,:line_manager_id,:leave_end_date,
            :leave_start_date,:leave_type, presence: true



  aasm :move, column: 'approve' do
    state :pending, initial: true
    state :pre_approved, :approved , :rejected
  #
    event :pre_approve do
      transitions from: [:pending], to: :pre_approved
    end
  #
    event :final_approve do
      transitions from: [:pre_approved], to: :approved
    end
  #
    event :reject do
      transitions from: [:pending, :pre_approved], to: :rejected
    end
  end
end
