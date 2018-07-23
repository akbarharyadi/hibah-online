module Admin
  class HomepagesController < Admin::ApplicationController
    before_action :set_homepage, only: [:show, :edit, :update, :destroy]
    before_action :set_role_admin

    # GET /homepages
    # GET /homepages.json
    def index
      @homepages = Homepage.all
    end

    # GET /homepages/1
    # GET /homepages/1.json
    def show
    end

    # GET /homepages/new
    def new
      @homepage = Homepage.new
    end

    # GET /homepages/1/edit
    def edit
    end

    # POST /homepages
    # POST /homepages.json
    def create
      @homepage = Homepage.new(homepage_params)

      respond_to do |format|
        if @homepage.save
          format.html { redirect_to @homepage, notice: 'Data Homepage berhasil disimpan.' }
          format.json { render :show, status: :created, location: @homepage }
        else
          format.html { render :new }
          format.json { render json: @homepage.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /homepages/1
    # PATCH/PUT /homepages/1.json
    def update
      respond_to do |format|
        if @homepage.update(homepage_params)
          format.html { redirect_to edit_admin_homepage_path(1), notice: 'Data Homepage berhasil diubah.' }
          format.json { render :show, status: :ok, location: @homepage }
        else
          format.html { render :edit }
          format.json { render json: @homepage.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /homepages/1
    # DELETE /homepages/1.json
    def destroy
      @homepage.destroy
      respond_to do |format|
        format.html { redirect_to homepages_url, notice: 'Homepage was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_homepage
        @homepage = Homepage.find(1)
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def homepage_params
        params.require(:homepage).permit(:gambar_1, :gambar_1_cache, :remove_gambar_1, :text_1_1, :text_1_2, :text_1_3, 
          :gambar_2, :gambar_2_cache, :remove_gambar_2, :text_2_1, :text_2_2, :gambar_3, :gambar_3_cache, :remove_gambar_3, :text_3_1, :text_3_2,
          tahapans_attributes: [:id, :homepage_id, :icon, :judul, :deskripsi, :_destroy]
          )
      end
  end
end
