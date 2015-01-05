require 'test_helper'

class TargetsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

	def setup
		sign_in users(:one)
	end

  test "should get index" do
  	get :index
  	assert_response :success
  end

  test "should get show" do
  	get(:show, {'id' => "#{targets(:one).id}"})
  	assert_response :success
  end

  test "should get new" do
  	get :new
  	assert_response :success
  end

end
