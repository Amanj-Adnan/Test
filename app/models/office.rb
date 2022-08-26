class Office < ApplicationRecord
  belongs_to :city
  belongs_to :hr_officer , class_name: 'User' , foreign_key: :user_id
  has_many :user_workflows, dependent: :destroy
  validates :name, presence: true ,  uniqueness: {
    scope: [ :city_id ]
  }
  
  validates_associated :hr_officer

end
