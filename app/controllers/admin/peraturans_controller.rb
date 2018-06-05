module Admin
  class PeraturansController < Admin::ApplicationController
    before_action :set_peraturan, only: [:show, :edit, :update, :destroy]

    # GET /peraturans
    # GET /peraturans.json
    def index
      @peraturans = Peraturan.all
    end

    # GET /peraturans/1
    # GET /peraturans/1.json
    def show
    end

    # GET /peraturans/new
    def new
      @peraturan = Peraturan.new
    end

    # GET /peraturans/1/edit
    def edit
    end

    # POST /peraturans
    # POST /peraturans.json
    def create
      @peraturan = Peraturan.new(peraturan_params)

      respond_to do |format|
        if @peraturan.save
          format.html { redirect_to admin_peraturans_path, notice: 'Data Peraturan hibah berhasil disimpan.' }
          format.json { render :show, status: :created, location: @peraturan }
        else
          format.html { render :new }
          format.json { render json: @peraturan.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /peraturans/1
    # PATCH/PUT /peraturans/1.json
    def update
      respond_to do |format|
        if @peraturan.update(peraturan_params)
          format.html { redirect_to admin_peraturans_path, notice: 'Data Peraturan hibah berhasil diubah.' }
          format.json { render :show, status: :ok, location: @peraturan }
        else
          format.html { render :edit }
          format.json { render json: @peraturan.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /peraturans/1
    # DELETE /peraturans/1.json
    def destroy
      @peraturan.destroy
      respond_to do |format|
        format.html { redirect_to admin_peraturans_path, notice: 'Data Peraturan hibah berhasil dihapus.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_peraturan
        @peraturan = Peraturan.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def peraturan_params
        params.require(:peraturan).permit(:nama, :file, :file_cache, :remove_file)
      end
  end
end
