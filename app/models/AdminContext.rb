class AdminContext

  attr_reader :user, :admin

  def initialize(user, admin)
    @user = user
    @admin = admin
  end
end