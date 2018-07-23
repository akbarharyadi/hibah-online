module Admin
  class TentangsController < Admin::ApplicationController
    before_action :set_tentang, only: [:show, :edit, :update, :destroy]
    before_action :set_role_admin

    # GET /tentangs
    # GET /tentangs.json
    def index
      @tentangs = Tentang.all
    end

    # GET /tentangs/1
    # GET /tentangs/1.json
    def show
    end

    # GET /tentangs/new
    def new
      @tentang = Tentang.new
    end

    # GET /tentangs/1/edit
    def edit
    end

    # POST /tentangs
    # POST /tentangs.json
    def create
      @tentang = Tentang.new(tentang_params)

      respond_to do |format|
        if @tentang.save
          format.html { redirect_to admin_tentangs_path, notice: 'Data Info website berhasil disimpan.' }
          format.json { render :show, status: :created, location: @tentang }
        else
          format.html { render :new }
          format.json { render json: @tentang.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tentangs/1
    # PATCH/PUT /tentangs/1.json
    def update
      respond_to do |format|
        if @tentang.update(tentang_params)
          format.html { redirect_to admin_tentangs_path, notice: 'Data Info website berhasil diubah.' }
          format.json { render :show, status: :ok, location: @tentang }
        else
          format.html { render :edit }
          format.json { render json: @tentang.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tentangs/1
    # DELETE /tentangs/1.json
    def destroy
      @tentang.destroy
      respond_to do |format|
        format.html { redirect_to tentangs_url, notice: 'Data Info website berhasil dihapus.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tentang
        @tentang = Tentang.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def tentang_params
        params.require(:tentang).permit(:judul, :konten, :gambar, :gambar_cache, :remove_gambar)
      end
  end
end
