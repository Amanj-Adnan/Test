class CountriesController < ApplicationController
  before_action :authorized_admin
  layout('admin')

  def index

  end

  def new
    @country = Country.new
    @countries = Country.all
  end

  def create
    @country = Country.create(get_params)
    if @country.save
      redirect_to admin_country_path
    else
      flash[:alert] = "The name was already taken or empty."
      redirect_back fallback_location:admin_country_path
    end
  end

  private

  def get_params
    params.require(:country).permit(:name)
  end
end
