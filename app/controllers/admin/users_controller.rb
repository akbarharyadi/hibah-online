module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: [:edit, :update]
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      @users = User.all.order('id asc')
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to admin_users_path, notice: 'Data user berhasil disimpan.' }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to admin_users_path, notice: 'Data Info website berhasil diubah.' }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # Define a custom finder by overriding the `find_resource` method:
    def set_user
      @user = User.find(params[:id])
    end


    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role_id, :dina_id)
    end
    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
