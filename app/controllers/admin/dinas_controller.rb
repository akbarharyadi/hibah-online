module Admin
  class DinasController < Admin::ApplicationController
    before_action :set_dinas, only: [:edit, :update, :destroy]
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      @dinas = Dina.all.order('id asc')
    end

    def new
      @dinas = Dina.new
    end

    def create
      @dinas = Dina.new(dinas_params)
      respond_to do |format|
        if @dinas.save
          format.html { redirect_to admin_dinas_path, notice: 'Data Dinas berhasil disimpan.' }
        else
          format.html { render :new }
          format.json { render json: @dinas.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @dinas.update(dinas_params)
          format.html { redirect_to admin_dinas_path, notice: 'Data Dinas berhasil diubah.' }
        else
          format.html { render :edit }
          format.json { render json: @dinas.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @dinas.destroy
      respond_to do |format|
        format.html { redirect_to admin_dinas_path, notice: 'Data Dinas berhasil dihapus.' }
        format.json { head :no_content }
      end
    end

    # Define a custom finder by overriding the `find_resource` method:
    def set_dinas
      @dinas = Dina.find(params[:id])
    end


    def dinas_params
      params.require(:dina).permit(:code, :name, :address)
    end
    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
