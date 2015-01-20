require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get log_in" do
    get :log_in
    assert_response :success
  end

  test "should get session_create" do
    get :session_create
    assert_response :success
  end

  test "should get log_out" do
    get :log_out
    assert_response :success
  end

  test "should get delete_user" do
    get :delete_user
    assert_response :success
  end

  test "should get change_category" do
    get :change_category
    assert_response :success
  end

  test "should get delete_target" do
    get :delete_target
    assert_response :success
  end

  test "should get mark_great" do
    get :mark_great
    assert_response :success
  end

end
