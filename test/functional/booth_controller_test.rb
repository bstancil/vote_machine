require 'test_helper'

class BoothControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#main .entry', 3
    assert_select 'h3', 'iphone5'
  end

end
