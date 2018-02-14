class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :track_action

  protected

  def track_action
    return if ahoy.visit
    ahoy.track "Viewed #{controller_path}##{action_name}", params: request.path_parameters
  end
end
