require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get :index" do
    get top_:index_url
    assert_response :success
  end

end
