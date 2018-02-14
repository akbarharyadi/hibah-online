class HibahsController < ApplicationController
  before_action :set_hibah, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /hibahs
  # GET /hibahs.json
  def index
    @hibahs = Hibah.where(user_id: current_user.id).all
  end

  # GET /hibahs/1
  # GET /hibahs/1.json
  def show
  end

  # GET /hibahs/new
  def new
    @hibah = Hibah.new
  end

  # GET /hibahs/1/edit
  def edit
  end

  # POST /hibahs
  # POST /hibahs.json
  def create
    @hibah = Hibah.new(hibah_params)
    @hibah.user_id = current_user.id if current_user.present?
    respond_to do |format|
      if @hibah.save
        format.html { redirect_to @hibah, notice: 'Hibah was successfully created.' }
        format.json { render :show, status: :created, location: @hibah }
      else
        format.html { render :new }
        format.json { render json: @hibah.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hibahs/1
  # PATCH/PUT /hibahs/1.json
  def update
    respond_to do |format|
      if @hibah.update(hibah_params)
        format.html { redirect_to @hibah, notice: 'Hibah was successfully updated.' }
        format.json { render :show, status: :ok, location: @hibah }
      else
        format.html { render :edit }
        format.json { render json: @hibah.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hibahs/1
  # DELETE /hibahs/1.json
  def destroy
    @hibah.destroy
    respond_to do |format|
      format.html { redirect_to hibahs_url, notice: 'Hibah was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hibah
      @hibah = Hibah.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hibah_params
      params.require(:hibah).permit(:nama, :alamat, :judul_kegiatan, :latar_belakang, 
      :maksud_dan_tujuan, :user_id, :on_process, :proposal, :proposal_cache, :remove_proposal , 
      :gambar, :gambar_cache, :remove_gambar,
      danas_attributes: [:id, :hibah_id, :jumlah, :deskripsi, :_destroy])
    end
end
