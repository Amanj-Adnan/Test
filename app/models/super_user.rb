class SuperUser < ApplicationRecord
  def reject
    puts 'sending email to the author explaining the reason...'
  end
  belongs_to :role

end
