require 'test_helper'

class SubCastesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
