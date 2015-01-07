require 'test_helper'

class TargetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:one)
  	@target = @user.targets.new
  end

  test "create target without attribute" do
  	assert_not @target.save, "Saved target without attribute"
  end

  test "create target with start time in the past" do
  	@target.name = "target name"
  	@target.detail = "target detail"
  	@target.start_time = Date.today - 10
  	@target.finish_time = Date.today + 10
    @target.category_id = 1
  	assert_not @target.save, "Saved target with start time in the past"
  end

  test "create target with finish time earlier than start time" do
  	@target.name = "target name"
  	@target.detail = "target detail"
  	@target.start_time = Date.today
  	@target.finish_time = Date.today - 10
    @target.category_id = 1
  	assert_not @target.save, "finish time earlier than start time"
  end
  	
  	

  test "create target correct" do
  	@target.name = "target name"
  	@target.detail = "target detail"
  	@target.start_time = Date.today
  	@target.finish_time = Date.today + 10
    @target.category_id = 1
  	assert @target.save, "Saved target correct"
  end
end
