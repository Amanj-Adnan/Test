class SuperUser < ApplicationRecord
  def reject
    puts 'sending email to the author explaining the reason...'
  end
  has_one :role, dependent: :destroy

end
