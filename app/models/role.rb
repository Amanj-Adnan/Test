class Role < ApplicationRecord

  has_and_belongs_to_many :permissions

  validates :name , uniqueness: true

  before_update do
      ActiveRecord::Base.connection.execute("DELETE FROM permissions_roles WHERE role_id = '#{self.id}'")
  end
end
