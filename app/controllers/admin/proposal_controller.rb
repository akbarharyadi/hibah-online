module Admin
  class ProposalController < Admin::ApplicationController
    include SmartListing::Helper::ControllerExtensions
    helper  SmartListing::Helper
    def index
      hibah = Hibah.all
      hibah = hibah.where("status= ?", params[:status_bansos]) if params[:status_bansos].present?
      hibah = hibah.where("upper(judul_kegiatan) like ?", "%#{params[:judul_bansos].upcase}%") if params[:judul_bansos].present?
      hibah = hibah.where("upper(nama) like ?", "%#{params[:organisasi_bansos].upcase}%") if params[:organisasi_bansos].present?
      # hibah = hibah.where("judul_kegiatan", params[:judul_bansos]) if params[:judul_bansos].present?
      @hibahs = smart_listing_create(:hibah, hibah, partial: "admin/proposal/listing_hibah")
    end
    def seleksi
    end
  end
end
