module Admin
    class PelaporansController < Admin::ApplicationController
      before_action :set_role_admin

      def report_hibah
        respond_to do |format|
            format.html
            format.xlsx do
                @line_1 = 'Laporan Hibah Bansos Kabupaten Purwakarta'
                @line_2 = 'Tanggal : ' + params[:hibah][:start_date] + ' s/d ' + params[:hibah][:final_date]
                @query = Hibah.all
                @query = @query.where("status=#{params[:hibah][:msg_open]}") if params[:hibah][:msg_open].present?
                if params[:hibah][:start_date].present? && params[:hibah][:final_date].present?
                    @query = @query.where("created_at between '#{DateTime.parse(params[:hibah][:start_date]).strftime("%Y/%m/%d")}' and '#{DateTime.parse(params[:hibah][:final_date]).strftime("%Y/%m/%d")}'") if params[:hibah][:msg_open].present?
                end
            end
        end
      end
    end
end