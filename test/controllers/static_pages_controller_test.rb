require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
	include Devise::TestHelpers
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
  	get :index
  	assert_response :success
  end

  test "should get hot" do
  	get :hot
  	assert_response :success
  end

  test "should get great" do
  	get :great
  	assert_response :success
  end
end
