class OfficesController < ApplicationController
  before_action :authorized_admin
  # before_action :get_city,only: [:create,:new]
  layout('admin')

  def index

  end

  def new
    @office= Office.new
    @country = get_city.country
    @city = get_city
    @offices = get_city.offices
    @hr_users = UserProfile.where("position LIKE ?", "%HR%").all
  end

  def create
    puts('>>>>>>>>>>>>>>>>>>>>>>>>')
    puts(get_params)
    puts('<<<<<<<<<<<<<<<<<<<<<<<<')
    @office = get_city.offices.create(get_params)
    if @office.save
      redirect_to admin_office_path(:city => get_city.id )
    else
      flash[:error] = @office.errors.full_messages.to_sentence
      redirect_back fallback_location:admin_office_path(:city => get_city.id )
    end
  end


  private

  def get_city
    @city= City.find(params[:city])
  end

  def get_params
    params.require(:office).permit(:name,:user_id , :address, :location)
  end

end
