class Role < ApplicationRecord
  has_and_belongs_to_many :categories

  validates :name , uniqueness: true , presence: true

  after_update do
      ActiveRecord::Base.connection.execute("DELETE FROM categories_roles WHERE role_id = '#{self.id}'")
  end


end
