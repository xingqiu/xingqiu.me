class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def login_required
    if author_signed_in?
      return true
    end
    redirect_to "/authors/sign_in"
    return false
  end

  def after_sign_in_path_for(resource)
    admin_root_path
  end

  protected
  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end
end
