class HomeController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    @homepage = Homepage.find(1)
    hibah = Hibah.all
    hibah = hibah.order("id "+params[:hibah_sort]) if params[:hibah_sort].present?
    @hibahs = smart_listing_create(:hibah, hibah, partial: "home/listing_hibah")
  end
  def tentang
    @tentang = Tentang.all
  end
  def daftar_hibah
    hibah = Hibah.all
    hibah = hibah.order("id "+params[:hibah_sort]) if params[:hibah_sort].present?
    hibah = hibah.where("upper(judul_kegiatan) like ?", "%#{params[:judul_bansos].upcase}%") if params[:judul_bansos].present?
    # hibah = hibah.where("judul_kegiatan", params[:judul_bansos]) if params[:judul_bansos].present?
    @hibahs = smart_listing_create(:hibah, hibah, partial: "home/listing_hibah")
    @kategori = Kategori.all
  end
  def show
    @hibah = Hibah.find(params[:id])
  end
  def peraturan
    @peraturan = Peraturan.all
  end
end
