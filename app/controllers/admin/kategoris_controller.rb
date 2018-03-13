module Admin
  class KategorisController < Admin::ApplicationController
    before_action :set_kategori, only: [:edit, :update, :destroy]
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      @kategori = Kategori.order('id asc')
    end

    def new
      @kategori = Kategori.new
    end

    def create
      @kategori = Kategori.new(kategori_params)
      respond_to do |format|
        if @kategori.save
          format.html { redirect_to admin_kategoris_path, notice: 'Kategori was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @kategori.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @kategori.update(kategori_params)
          format.html { redirect_to admin_kategoris_path, notice: 'Kategori was successfully updated.' }
        else
          format.html { render :edit }
          format.json { render json: @kategori.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @kategori.destroy
      respond_to do |format|
        format.html { redirect_to admin_kategoris_path, notice: 'Kategori was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    # Define a custom finder by overriding the `find_resource` method:
    def set_kategori
      @kategori = Kategori.find(params[:id])
    end


    def kategori_params
      params.require(:kategori).permit(:name, :dina_id)
    end
    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
