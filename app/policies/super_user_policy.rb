class SuperUserPolicy < ApplicationPolicy


  def index?
    @super_user = SuperUser.find_by(id:@admin)
    @permissions = ActiveRecord::Base.connection.execute("SELECT categories.name FROM categories_roles RIGHT JOIN categories ON categories_roles.category_id = categories.id
    RIGHT JOIN roles ON  categories_roles.role_id = roles.id WHERE roles.id = '#{@super_user.role_id}' LIMIT 1 ")
    @per_name =[]
    @permissions.as_json.each do |permission|
    @per_name<<permission['name']
   end
    # puts(@permissions.as_json[0]['name'])
    if @super_user.role.name == 'admin'
       true
    elsif @per_name.include? 'super_user_view'
      true
    else
      false
    end

  end

end
