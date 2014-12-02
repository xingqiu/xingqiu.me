require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get account_require_verified" do
    get :account_require_verified
    assert_response :success
  end

end
