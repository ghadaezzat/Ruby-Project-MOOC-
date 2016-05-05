require 'test_helper'

class LecturesControllerTest < ActionController::TestCase
  test "should get home" do
    get :index
    assert_response :success
    #verifying there is a title calld home
    assert_select "title","home"
  end
end

