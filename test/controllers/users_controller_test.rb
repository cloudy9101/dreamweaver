require 'test_helper'

class UsersControllerTest < ActionController::TestCase

	include Devise::TestHelpers

	def setup
		@user = users(:one)
		sign_in @user
	end

  test "should get show" do
    get(:show, {'id' => "#{@user.id}"})
    assert_response :success
  end

end
