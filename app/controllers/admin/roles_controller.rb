module Admin
  class RolesController < Admin::ApplicationController
    before_action :set_role, only: [:edit, :update]
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      @roles = Role.all.order('id asc')
    end

    def edit
    end

    def update
      respond_to do |format|
        if @role.update(role_params)
          format.html { redirect_to admin_roles_path, notice: 'Role was successfully updated.' }
        else
          format.html { render :edit }
          format.json { render json: @role.errors, status: :unprocessable_entity }
        end
      end
    end

    # Define a custom finder by overriding the `find_resource` method:
    def set_role
      @role = Role.find(params[:id])
    end


    def role_params
      params.require(:role).permit(:name)
    end
    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
