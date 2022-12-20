class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  
  has_many :posts , dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_one :leave, dependent: :destroy
  has_many :leave_requests, dependent: :destroy
  # has_one :line_manager ,class_name: "LeaveRequest", foreign_key: "line_manager_id", dependent: :destroy
  # has_one :hr_officer ,class_name: "LeaveRequest", foreign_key: "hr_officer_id", dependent: :destroy
  belongs_to :user_workflow, optional: true

  has_one :office , foreign_key: "user_id"

  belongs_to :line_manager, class_name: 'UserWorkflow', foreign_key: 'line_manager_id' , optional: true




  scope :without_user_profiles, -> { where('NOT EXISTS(SELECT 1 FROM user_profiles WHERE user_id = users.id)') }
  scope :without_user_profiles_2, -> { where.missing(:user_profile) }
  # scope :hr_officers, ->{where('SELECT * FROM user_profiles WHERE position LIKE '%hr%' ')}




end
