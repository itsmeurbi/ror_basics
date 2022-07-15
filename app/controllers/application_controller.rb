class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:first_name, :last_name, :profile_picture])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end
end
