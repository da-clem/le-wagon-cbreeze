require 'test_helper'

class ForcastsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get forcasts_index_url
    assert_response :success
  end

end
