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
  end

  def create
    @office = get_city.offices.create(get_params)
    if @city.save
      redirect_to admin_office_path(:city => get_city.id )
    else
      flash[:alert] = "The name was already taken or empty."
      redirect_back fallback_location:admin_office_path(:city => get_city.id )
    end
  end


  private

  def get_city
    @city= City.find(params[:city])
  end

  def get_params
    params.require(:office).permit(:name, :address, :location)
  end

end
