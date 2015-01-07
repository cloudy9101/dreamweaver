require 'test_helper'

class DayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:one)
  	@user.targets.new(name: "target", detail: "target detail", start_time: Date.today, finish_time: Date.today + 10, category_id: 1).save
  	target = Target.find_by(name: "target")
  	@day = target.days.new
    @day.user = @user
  end

  test "create day with nothing" do
  	assert_not @day.save, "Saved with nothing"
  end

  test "create day correct" do
  	@day.date_at = Date.today
  	@day.comment = "day comment"
  	assert @day.save, "Saved day correct"
  end
end
