module Admin
  class KuncisController < Admin::ApplicationController
    before_action :set_kunci, only: [:edit, :update]
    before_action :set_role_admin

    def edit
    end

    def update
      respond_to do |format|
        if @kunci.update(kunci_params)
          format.html { redirect_to edit_admin_kunci_path(1), notice: 'Data Kunci Pendaftaran berhasil diubah.' }
          format.json { render :show, status: :ok, location: @kunci }
        else
          format.html { render :edit }
          format.json { render json: @kunci.errors, status: :unprocessable_entity }
        end
      end
    end
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_kunci
        @kunci = Kunci.find(1)
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def kunci_params
        params.require(:kunci).permit(:msg_open, :msg_close, :status, :start_date, :final_date)
      end
  end
end
