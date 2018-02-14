class HomeController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    @hibahs = smart_listing_create(:hibah, Hibah.all, partial: "home/listing_hibah")
  end
  def tentang
  end
  def daftar_hibah
    @hibahs = smart_listing_create(:hibah, Hibah.all, partial: "home/listing_hibah")
  end
  def show
    @hibah = Hibah.find(params[:id])
  end
end
