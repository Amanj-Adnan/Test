class Roles::RolesController < ApplicationController
  before_action :authorized_admin
  before_action :get_role_prams , only: [:create]
  layout('admin' )

  def index

  end

  def show

  end

  def new
    @new_role =Role.new
    @permissions = Permission.all
    @countries = Country.all
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
    @permissions = Permission.all
    @permission_ids = @role.permission_ids
    @countries = Country.all
    @country = @role.country_id
    @offices = @role.office_id.to_a
    @cities = @role.city_id.to_a
     @city = Country.find_by(id:@country).cities
    puts(@city)
    @office = []
    @city.each do |city|
      @office << city.offices
    end
    @office = @office.flatten
    @roles = Role.all
    render "admin/roles/edit"
  end

  def create
    ActiveRecord::Base.transaction do
      @permissions = params[:permissions].reject(&:empty?)
      @cities =  params[:cities].reject(&:empty?)
      @offices =  params[:offices].reject(&:empty?)
      @role = Role.create!(name: params[:name],country_id:params[:country],city_id:@cities,office_id:@offices ).permission_ids=@permissions
      flash[:alert] = "Role is Created"
      redirect_to admin_create_role_path
    end

   rescue ActiveRecord::RecordInvalid
     flash[:error] = "Something went wrong, Name must be unique"
     redirect_to admin_create_role_path
  end

  def update
    ActiveRecord::Base.transaction do
      @role = Role.find_by(id: params[:role_id])
      @permissions = params[:permissions].reject(&:empty?)
      @cities =  params[:cities].reject(&:empty?)
      @offices =  params[:offices].reject(&:empty?)
      @role.update(name: params[:name],country_id:params[:country],city_id:@cities,office_id:@offices)

      @permissions.each do |id|
        @permission = Permission.find_by(id:id)
        @role.permissions << @permission
      end

      flash[:alert] = "Role is Updated"
      redirect_to admin_create_role_path
    end

  rescue ActiveRecord::RecordInvalid
    flash[:error] = "Something went wrong, Name must be unique"
    redirect_to admin_create_role_path
  end

  def destroy

  end

  private

  def get_role_prams
    params.permit(:name , :country_id, :city_id,:office_id)
  end

end
