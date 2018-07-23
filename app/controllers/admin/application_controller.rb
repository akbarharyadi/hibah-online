# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!, :track_action

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    def track_action
      return if ahoy.visit
      ahoy.track "Viewed #{controller_path}##{action_name}", params: request.path_parameters
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found') and return
    rescue
      render_404
    end
  
    def render_404
      render file: "#{Rails.root}/public/422", status: :not_found and return
    end
    
    def set_role_admin
      not_found unless (1..3).include? current_user.role_id
    end
  end
end
