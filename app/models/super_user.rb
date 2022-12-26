class SuperUser < ApplicationRecord

  belongs_to :role

  validates :email ,uniqueness: true

  validates :email , :password, :role_id , presence: true

  before_update do
    if self.role.name == 'admin'
      throw(:abort)
    end
  end

end
