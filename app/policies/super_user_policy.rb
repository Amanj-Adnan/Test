class SuperUserPolicy < ApplicationPolicy


  def index?
    @super_user = SuperUser.find_by(id:@admin)
    @permissions = ActiveRecord::Base.connection.execute("SELECT categories.name FROM categories_roles RIGHT JOIN categories ON categories_roles.category_id = categories.id
    RIGHT JOIN roles ON  categories_roles.role_id = roles.id WHERE roles.id = '#{@super_user.role_id}' ")
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

  def edit?
    @super_user = SuperUser.find_by(id:@admin)
    @permissions = ActiveRecord::Base.connection.execute("SELECT categories.name FROM categories_roles RIGHT JOIN categories ON categories_roles.category_id = categories.id
    RIGHT JOIN roles ON  categories_roles.role_id = roles.id WHERE roles.id = '#{@super_user.role_id}'  ")
    @per_name =[]
    @permissions.as_json.each do |permission|
      @per_name<<permission['name']
    end
    if @super_user.role.name == 'admin'
      if record.role.name == 'admin'
        false
      else
        true
      end
    elsif @per_name.include? 'super_user_update'
      if record.role.name == 'admin'
        false
      else
        true
      end
    else
      false
    end
  end

  def update?
    @super_user = SuperUser.find_by(id:@admin)
    @permissions = ActiveRecord::Base.connection.execute("SELECT categories.name FROM categories_roles RIGHT JOIN categories ON categories_roles.category_id = categories.id
    RIGHT JOIN roles ON  categories_roles.role_id = roles.id WHERE roles.id = '#{@super_user.role_id}'  ")
    @per_name =[]
    @permissions.as_json.each do |permission|
      @per_name<<permission['name']
    end
    if @super_user.role.name == 'admin'
      if record.role.name == 'admin'
        false
      else
        true
      end
    elsif @per_name.include? 'super_user_update'
      if record.role.name == 'admin'
        false
      else
        true
      end
    else
      false
    end
  end

  def new?
    @super_user = SuperUser.find_by(id:@admin)
    @permissions = ActiveRecord::Base.connection.execute("SELECT categories.name FROM categories_roles RIGHT JOIN categories ON categories_roles.category_id = categories.id
    RIGHT JOIN roles ON  categories_roles.role_id = roles.id WHERE roles.id = '#{@super_user.role_id}'  ")
    @per_name =[]
    @permissions.as_json.each do |permission|
      @per_name<<permission['name']
    end
    if @super_user.role.name == 'admin'
      true
    elsif @per_name.include? 'super_user_add'
      true
    else
      false
    end
  end


  def create?
    @super_user = SuperUser.find_by(id:@admin)
    @permissions = ActiveRecord::Base.connection.execute("SELECT categories.name FROM categories_roles RIGHT JOIN categories ON categories_roles.category_id = categories.id
    RIGHT JOIN roles ON  categories_roles.role_id = roles.id WHERE roles.id = '#{@super_user.role_id}'  ")
    @per_name =[]
    @permissions.as_json.each do |permission|
      @per_name<<permission['name']
    end
    if @super_user.role.name == 'admin'
      if record.role.name == 'admin'
        record.destroy
        false
      else
        true
      end
    elsif @per_name.include? 'super_user_add'
      if record.role.name == 'admin'
        record.destroy
        false
      else
        true
      end
    else
      false
    end
  end

end
