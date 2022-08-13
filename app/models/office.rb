class Office < ApplicationRecord
  belongs_to :city
  has_many :user_workflows, dependent: :destroy
  validates :name, presence: true ,  uniqueness: {
    scope: [ :city_id ]
  }

end
