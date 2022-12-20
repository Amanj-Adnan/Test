class Roles::RolesController < ApplicationController
  before_action :authorized_admin
  before_action :get_role_prams , only: [:create]
  layout('admin' )

  def index
    @roles = Role.all
    render "admin/roles/index"
  end

  def show

  end

  def new
    @new_role =Role.new
    @permissions = Permission.all
    @countries = Country.all
    @categories =Category.all
    @category_names = []
    @categories.each do |category|
      @word = category.name.split('_')[0]
      if @category_names.empty?
        @category_names<<category
      elsif @category_names.last.name.split('_')[0] != @word
        @category_names<<category
      end
    end
    @categories = @category_names
    # @office = Office.all
    @roles = Role.all
    render "admin/roles/new"
  end

  def set_cities
    if params[:country_id] != ''
        @target = params[:target]
        @cities = Country.find(params[:country_id]).cities
        respond_to do |format|
          format.turbo_stream do
            render "admin/roles/set_cites"
          end
        end
    else
      @target = params[:target]
      @cities = {}
      respond_to do |format|
        format.turbo_stream do
          render "admin/roles/set_cites"
        end
      end
    end
  end

  def set_offices
    if params[:city_id] != ''
      @target = params[:target]
      @offices = City.find(params[:city_id]).offices
      respond_to do |format|
        format.turbo_stream do
          render "admin/roles/set_offices"
        end
      end
    else
      @target = params[:target]
      @offices = {}
      respond_to do |format|
        format.turbo_stream do
          render "admin/roles/set_offices"
        end
      end
    end
  end

  def edit
    @role = Role.find_by(id: params[:role_id])
    if @role.name == 'admin'
      flash[:error] = "You can't edit admin role"
      redirect_to admin_roles_path
    else
      # @permissions = Permission.all
      # @permission_ids = @role.permission_ids
      @countries = Country.all
      @country = @role.country_id
      @offices = @role.office_id.to_a
      @cities = @role.city_id.to_a
      @city = Country.find_by(id:@country).cities
      @office = []
      @city.each do |city|
        @office << city.offices
      end
      @selected_category_ids = @role.category_ids
      @selected_permissions = {}
      @categories = Category.all
      @category_names = []
      @categories.each do |category|
        @word = category.name.split('_')[0]
        if @category_names.empty?
          @category_names<<category
        elsif @category_names.last.name.split('_')[0] != @word
          @category_names<<category
        end
        if @selected_category_ids.include? category.id
          @selected_permissions.merge!({category.name => true})
        else
          @selected_permissions.merge!({category.name => false})
        end
      end
      @categories = @category_names
      @office = @office.flatten
      render "admin/roles/edit"
    end

  end

  def create

    @selected_categories = []
    @categories = Category.all

    @categories.each do |category|

      if params[category.name] == "1"
        @selected_categories<<category.id
      end
      # @selected_categories<<{ category.name => params[category.name] }
    end

    ActiveRecord::Base.transaction do
      @cities =  params[:cities].reject(&:empty?)
      @offices =  params[:offices].reject(&:empty?)
      @role = Role.create!(name: params[:name],country_id:params[:country],city_id:@cities,office_id:@offices).category_ids = @selected_categories
      flash[:alert] = "Role is Created"
      redirect_to admin_create_role_path
    end

   rescue ActiveRecord::RecordInvalid
     flash[:error] = "Something went wrong, Name must be unique"
     redirect_to admin_create_role_path
  end

  def update
    @selected_categories = []
    @categories = Category.all

    puts( params[:role])
    @categories.each do |category|
      if params[:role][category.name] == "1"
        @selected_categories<<category.id
      end
    end
     ActiveRecord::Base.transaction do
       @role = Role.find_by(id: params[:role_id])
       # @permissions = params[:permissions].reject(&:empty?)
       @cities =  params[:role][:cities].reject(&:empty?)
       @offices =  params[:role][:offices].reject(&:empty?)
      @role.update(name: params[:role][:name],country_id:params[:role][:country],city_id:@cities,office_id:@offices)

      @selected_categories.each do |id|
         @permission = Category.find_by(id:id)
         @role.categories << @permission
       end
      flash[:alert] = "Role is Updated"
      redirect_to admin_roles_path
     end

  rescue ActiveRecord::RecordInvalid
    flash[:error] = "Something went wrong, Name must be unique"
    redirect_to admin_roles_path
  end

  def destroy

  end

  private

  def get_role_prams
    params.permit(:name , :country_id, :city_id,:office_id)
  end

end
