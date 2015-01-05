require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new
  end

  test "create a user without an email" do
  	
  	assert_not @user.save, "Saved user without an email"
  end

  test "create a user without a name" do
  	
  	@user.email = "user@exam.ple"
  	@user.password = "111111"
  	assert_not @user.save, "Saved user without a name"
  end

  test "create a user without a password" do
  	
  	@user.email = "user@exam.ple"
  	@user.name = "user"
  	assert_not @user.save, "Saved user without a password"
  end

  test "create a user with too short password" do
  	
  	@user.email = "user@exam.ple"
  	@user.password = "1"
  	@user.name = "user"
  	assert_not @user.save, "Saved user with too short password"
  end

  test "create a user with the same name" do
  	@user.email = "user@exam.ple"
  	@user.password = "111111"
  	@user.name = "user"
  	@user.save
  	user_same_name = User.new(email: "user1@exam.ple", password: "111111", name: "user")
  	assert_not user_same_name.save, "Saved user with same name"
  end

  test "create a user" do
  	
  	@user.email = "user@exam.ple"
  	@user.password = "111111"
  	@user.name = "user"
  	assert @user.save, "Saved user correct"
  end

end
