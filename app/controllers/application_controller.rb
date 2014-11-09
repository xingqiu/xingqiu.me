class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def login_required
    if author_signed_in?
      return true
    end
    redirect_to "/authors/sign_in"
    return false
  end
end
