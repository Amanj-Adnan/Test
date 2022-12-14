class Category < ApplicationRecord
  self.table_name = "categories"
  has_and_belongs_to_many :roles

  validates :name  , presence: true , uniqueness: true
end
