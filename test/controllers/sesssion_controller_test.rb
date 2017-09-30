require 'test_helper'

class SesssionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sesssion_new_url
    assert_response :success
  end

end
