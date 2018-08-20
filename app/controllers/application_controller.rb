class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :track_action

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :kunci_pendaftaran

  protected
    def track_action
      return if ahoy.visit
      ahoy.track "Viewed #{controller_path}##{action_name}", params: request.path_parameters
    end
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nama_ketua, :alamat, :nomor_telp, :nama_organisasi, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nama_ketua, :alamat, :nomor_telp, :nama_organisasi, :email, :password, :current_password)}
    end

    def kunci_pendaftaran
      @kunci = Kunci.find(1)
      @homepage = Homepage.find(1)
    end
end
