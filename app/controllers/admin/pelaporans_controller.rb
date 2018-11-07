module Admin
    class PelaporansController < Admin::ApplicationController

      def report_hibah
        before_pelaporan
        respond_to do |format|
            format.html
            format.xlsx do
                @line_1 = 'Daftar Penerima Hibah Bansos Kabupaten Purwakarta yang telah Disetujui'
                if params[:hibah][:start_date].present? && params[:hibah][:final_date].present?
                    @line_2 = 'Tanggal : ' + params[:hibah][:start_date] + ' s/d ' + params[:hibah][:final_date] + ' Tahun ' + DateTime.parse(params[:hibah][:start_date]).strftime("%Y").to_s
                else
                    @line_2 = '' 
                end
                @query = Hibah.all
                @query = @query.where("status=6")
                if params[:hibah][:start_date].present? && params[:hibah][:final_date].present?
                    @query = @query.where("created_at between '#{DateTime.parse(params[:hibah][:start_date]).strftime("%Y/%m/%d")}' and '#{DateTime.parse(params[:hibah][:final_date]).strftime("%Y/%m/%d")}'") if params[:hibah][:msg_open].present?
                end
                response.headers['Content-Disposition'] = 'attachment; filename="Laporan Hibah Bansos yang sudah disetujui '+@line_2+'.xlsx"'
            end
        end
      end

      def report_penetapan
        before_pelaporan
        respond_to do |format|
            format.html
            format.xlsx do
                @line_1 = 'Laporan Hibah Bansos Kabupaten Purwakarta'
                if params[:hibah][:start_date].present? && params[:hibah][:final_date].present?
                    @line_2 = 'Tanggal : ' + params[:hibah][:start_date] + ' s/d ' + params[:hibah][:final_date] + ' Tahun ' + DateTime.parse(params[:hibah][:start_date]).strftime("%Y").to_s
                else
                    @line_2 = '' 
                end
                @query = Hibah.all
                # @query = @query.where("status=5")
                if params[:hibah][:start_date].present? && params[:hibah][:final_date].present?
                    @query = @query.where("created_at between '#{DateTime.parse(params[:hibah][:start_date]).strftime("%Y/%m/%d")}' and '#{DateTime.parse(params[:hibah][:final_date]).strftime("%Y/%m/%d")}'") if params[:hibah][:msg_open].present?
                end
                response.headers['Content-Disposition'] = 'attachment; filename="Laporan Hibah Bansos '+@line_2+'.xlsx"'
            end
        end
      end
    end

    def before_pelaporan
        not_found unless (1..6).include? current_user.role_id
    end
end