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
      before_seleksi
      hibah = Hibah.all
      hibah = hibah.where("status= ?", 0)
      hibah = hibah.where("upper(judul_kegiatan) like ?", "%#{params[:judul_bansos].upcase}%") if params[:judul_bansos].present?
      hibah = hibah.where("upper(nama) like ?", "%#{params[:organisasi_bansos].upcase}%") if params[:organisasi_bansos].present?
      # hibah = hibah.where("judul_kegiatan", params[:judul_bansos]) if params[:judul_bansos].present?
      @hibahs = smart_listing_create(:hibah, hibah, partial: "admin/proposal/listing_hibah")
      @judul = 'SELEKSI PROPOSAL HIBAH'
      render "admin/proposal/index_global"
    end

    def proses_seleksi
      before_seleksi
      @hibah = Hibah.find(params[:id])
      @seleksis = Seleksi.where(hibah_id: params[:id]).last
      @seleksi = Seleksi.new
      @seleksi.status = @seleksis.status if @seleksis.present?
      @seleksi.keterangan = @seleksis.keterangan if @seleksis.present?
    end

    def simpan_seleksi
      before_seleksi
      @seleksi = Seleksi.new(seleksis_params)
      @hibah = Hibah.find(params[:seleksi][:hibah_id])
      @hibah.status = 1
      @hibah.status = 7 if @seleksi.status == 1
      respond_to do |format|
        if @seleksi.save and @hibah.save
          format.html { redirect_to admin_proposal_seleksi_path, notice: 'Proses seleksi berhasil.' }
        else
          format.html { render :proses_seleksi }
        end
      end
    end

    def disposisi
      before_disposisi
      hibah = Hibah.all
      hibah = hibah.where("status= ?", 1)
      hibah = hibah.where("upper(judul_kegiatan) like ?", "%#{params[:judul_bansos].upcase}%") if params[:judul_bansos].present?
      hibah = hibah.where("upper(nama) like ?", "%#{params[:organisasi_bansos].upcase}%") if params[:organisasi_bansos].present?
      # hibah = hibah.where("judul_kegiatan", params[:judul_bansos]) if params[:judul_bansos].present?
      @hibahs = smart_listing_create(:hibah, hibah, partial: "admin/proposal/listing_hibah")
      @judul = 'DISPOSISI PROPOSAL HIBAH'
      render "admin/proposal/index_global"
    end
    
    def proses_disposisi
      before_disposisi
      @hibah = Hibah.find(params[:id])
      @diss = Disposisi.where(hibah_id: params[:id]).last
      @disposisi = Disposisi.new
      @disposisi.status = @diss.status if @diss.present?
      @disposisi.keterangan = @diss.keterangan if @diss.present?
    end

    def simpan_disposisi
      before_disposisi
      @diss = Disposisi.new(disposisis_params)
      @hibah = Hibah.find(params[:disposisi][:hibah_id])
      @hibah.status = 2
      @hibah.status = 7 if @diss.status == 1
      respond_to do |format|
        if @diss.save and @hibah.save
          format.html { redirect_to admin_proposal_disposisi_path, notice: 'Proses disposisi berhasil.' }
        else
          format.html { render :proses_disposisi }
        end
      end
    end

    def distribusi
      before_distribusi
      hibah = Hibah.all
      hibah = hibah.where("status= ?", 2)
      hibah = hibah.where("upper(judul_kegiatan) like ?", "%#{params[:judul_bansos].upcase}%") if params[:judul_bansos].present?
      hibah = hibah.where("upper(nama) like ?", "%#{params[:organisasi_bansos].upcase}%") if params[:organisasi_bansos].present?
      # hibah = hibah.where("judul_kegiatan", params[:judul_bansos]) if params[:judul_bansos].present?
      @hibahs = smart_listing_create(:hibah, hibah, partial: "admin/proposal/listing_hibah")
      @judul = 'DISTRIBUSI PROPOSAL HIBAH'
      render "admin/proposal/index_global"
    end

    def proses_distribusi
      before_distribusi
      @hibah = Hibah.find(params[:id])
      @diss = Distribusi.where(hibah_id: params[:id]).last
      @dis = Distribusi.new
      @dis.dina_id = @diss.dina_id if @diss.present?
      @dis.keterangan = @diss.keterangan if @diss.present?
    end

    def simpan_distribusi
      before_distribusi
      @Distribusi = Distribusi.where(hibah_id: params[:distribusi][:hibah_id]).last
      @Distribusi = Distribusi.new(distribusis_params) if !@Distribusi.present?
      @hibah = Hibah.find(params[:distribusi][:hibah_id])
      @hibah.status = 3
      respond_to do |format|
        if @Distribusi.save and @hibah.save
          format.html { redirect_to admin_proposal_distribusi_path, notice: 'Proses distribusi berhasil.' }
        else
          format.html { render :proses_distribusi }
        end
      end
    end

    def evaluasi
      before_evaluasi
      hibah = Hibah.all
      hibah = hibah.joins(:distribusis)
      hibah = hibah.where("status= ?", 3)
      hibah = hibah.where("dina_id= ?", current_user.dina_id) unless current_user.role_id == 1 or current_user.role_id == 2
      hibah = hibah.where("upper(judul_kegiatan) like ?", "%#{params[:judul_bansos].upcase}%") if params[:judul_bansos].present?
      hibah = hibah.where("upper(nama) like ?", "%#{params[:organisasi_bansos].upcase}%") if params[:organisasi_bansos].present?
      @hibahs = smart_listing_create(:hibah, hibah, partial: "admin/proposal/listing_hibah")
      @judul = 'EVALUASI PROPOSAL HIBAH'
      render "admin/proposal/index_global"
    end

    def proses_evaluasi
      before_evaluasi
      @hibah = Hibah.find(params[:id])
      @evas = Evaluasi.where(hibah_id: params[:id]).last
      @eva = Evaluasi.new
      @eva.keterangan = @evas.keterangan if @evas.present?
    end

    def simpan_evaluasi
      before_evaluasi
      @eva = Evaluasi.where(hibah_id: params[:evaluasi][:hibah_id]).last
      @eva = Evaluasi.new(evaluasis_params) if !@eva.present?
      @hibah = Hibah.find(params[:evaluasi][:hibah_id])
      @hibah.status = 4
      respond_to do |format|
        if @eva.save and @hibah.save
          format.html { redirect_to admin_proposal_evaluasi_path, notice: 'Proses evaluasi berhasil.' }
        else
          format.html { render :proses_evaluasi }
        end
      end
    end

    def pertimbangan
      before_pertimbangan
      hibah = Hibah.all
      hibah = hibah.where("status= ?", 4)
      hibah = hibah.where("upper(judul_kegiatan) like ?", "%#{params[:judul_bansos].upcase}%") if params[:judul_bansos].present?
      hibah = hibah.where("upper(nama) like ?", "%#{params[:organisasi_bansos].upcase}%") if params[:organisasi_bansos].present?
      @hibahs = smart_listing_create(:hibah, hibah, partial: "admin/proposal/listing_hibah")
      @judul = 'PERTIMBANGAN PROPOSAL HIBAH'
      render "admin/proposal/index_global"
    end

    def proses_pertimbangan
      before_pertimbangan
      @hibah = Hibah.find(params[:id])
      @per = Pertimbangan.where(hibah_id: params[:id]).last
      @per = Pertimbangan.new
      @per.keterangan = @per.keterangan if @per.present?
    end

    def simpan_pertimbangan
      before_pertimbangan
      @per = Pertimbangan.where(hibah_id: params[:pertimbangan][:hibah_id]).last
      @per = Pertimbangan.new(pertimbangans_params) if !@per.present?
      @hibah = Hibah.find(params[:pertimbangan][:hibah_id])
      @hibah.status = 5
      @hibah.status = 7 if @per.status == 1
      respond_to do |format|
        if @per.save and @hibah.save
          format.html { redirect_to admin_proposal_pertimbangan_path, notice: 'Proses pertimbangan berhasil.' }
        else
          format.html { render :proses_pertimbangan }
        end
      end
    end

    def penetapan
      before_penetapan
      hibah = Hibah.all
      hibah = hibah.where("status= ?", 5)
      hibah = hibah.where("upper(judul_kegiatan) like ?", "%#{params[:judul_bansos].upcase}%") if params[:judul_bansos].present?
      hibah = hibah.where("upper(nama) like ?", "%#{params[:organisasi_bansos].upcase}%") if params[:organisasi_bansos].present?
      @hibahs = smart_listing_create(:hibah, hibah, partial: "admin/proposal/listing_hibah")
      @judul = 'PENETAPAN PROPOSAL HIBAH'
      render "admin/proposal/index_global"
    end

    def proses_penetapan
      before_penetapan
      @hibah = Hibah.find(params[:id])
      @pen = Penetapan.where(hibah_id: params[:id]).last
      @pen = Penetapan.new
    end

    def simpan_penetapan
      before_penetapan
      @pen = Penetapan.where(hibah_id: params[:penetapan][:hibah_id]).last
      @pen = Penetapan.new(penetapans_params) if !@pen.present?
      @hibah = Hibah.find(params[:penetapan][:hibah_id])
      @hibah.status = 6
      respond_to do |format|
        if @pen.save and @hibah.save
          format.html { redirect_to admin_proposal_penetapan_path, notice: 'Proses Penetapan berhasil.' }
        else
          format.html { render :proses_penetapan }
        end
      end
    end

    def before_seleksi
      not_found unless current_user.role_id == 1 or current_user.role_id == 2 or current_user.role_id == 4
    end

    def before_disposisi
      not_found unless current_user.role_id == 1 or current_user.role_id == 2 or current_user.role_id == 3
    end

    def before_distribusi
      not_found unless current_user.role_id == 1 or current_user.role_id == 2 or current_user.role_id == 4
    end

    def before_evaluasi
      not_found unless current_user.role_id == 1 or current_user.role_id == 2 or current_user.role_id == 5
    end

    def before_pertimbangan
      not_found unless current_user.role_id == 1 or current_user.role_id == 2 or current_user.role_id == 6
    end

    def before_penetapan
      not_found unless current_user.role_id == 1 or current_user.role_id == 2 or current_user.role_id == 3
    end
    
    def seleksis_params
      params.require(:seleksi).permit(:status, :keterangan, :user_id, :hibah_id, :id)
    end
    
    def disposisis_params
      params.require(:disposisi).permit(:status, :keterangan, :user_id, :hibah_id, :id)
    end
    
    def distribusis_params
      params.require(:distribusi).permit(:dina_id, :keterangan, :user_id, :hibah_id, :id)
    end

    def evaluasis_params
      params.require(:evaluasi).permit(:file_upload, :file_upload_cache, :remove_file_upload, :keterangan, :user_id, :hibah_id, :id)
    end

    def pertimbangans_params
      params.require(:pertimbangan).permit(:status, :realisasi, :keterangan, :user_id, :hibah_id, :id, :file, :file_cache, :remove_file)
    end

    def penetapans_params
      params.require(:penetapan).permit(:tgl_ketetapan, :user_id, :hibah_id, :id)
    end
  end
end
