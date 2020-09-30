class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    end

    def after_sign_in_path_for(resource)
      case resource
      when Member
        root_path
      when AdminUser
        root_path
      end
    end

    def after_sign_out_path_for(resource)
      root_path
    end

end
