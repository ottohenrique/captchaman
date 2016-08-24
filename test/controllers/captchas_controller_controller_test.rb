require 'test_helper'

class CaptchasControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get captchas_controller_create_url
    assert_response :success
  end

  test "should get show" do
    get captchas_controller_show_url
    assert_response :success
  end

end
