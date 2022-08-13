class CitiesController < ApplicationController
  before_action :authorized_admin
  # before_action :get_country,only: [:new,:create]
  layout('admin')

  def index

  end

  def new
    @city= City.new
    @cities= get_country.cities.all
  end


  def create
    @city = get_country.cities.create(get_params)
    if @city.save
      redirect_to admin_cities_path(:country => get_country.id)
    else
      flash[:alert] = "The name was already taken or empty."
      redirect_back fallback_location:admin_cities_path(:country => get_country.id)
    end
  end

  private

  def get_country
    @country= Country.find(params[:country])
  end

  def get_params
    params.require(:city).permit(:name)
  end
end
