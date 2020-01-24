class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    added_attrs = %i[last_name first_name avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || chat_rooms_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
