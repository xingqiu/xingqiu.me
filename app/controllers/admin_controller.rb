class AdminController < ApplicationController
  layout "admin"
  def account_require_verified
    redirect_to "/authors/sign_in" unless author_signed_in?
  end
end
