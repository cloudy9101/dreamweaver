require 'test_helper'

class CategorysControllerTest < ActionController::TestCase
	include Devise::TestHelpers

  test "should get show" do
    get(:show, { 'id' => "1" })
    assert_response :success
  end

end
