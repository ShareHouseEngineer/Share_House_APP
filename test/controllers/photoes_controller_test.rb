require 'test_helper'

class PhotoesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photoes_index_url
    assert_response :success
  end

end
