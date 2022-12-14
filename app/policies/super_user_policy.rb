class SuperUserPolicy < ApplicationPolicy



  def index?
    @super_user = SuperUser.find_by(id:@admin)
    if @super_user.role.name != 'admin'
    puts(@super_user)

    puts(@super_user.email)

    return false
    end
    true
  end

end
