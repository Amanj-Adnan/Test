class SuperUser < ApplicationRecord

  belongs_to :role

  validates :email ,uniqueness: true

  validates :email , :password, :role_id , presence: true

end
