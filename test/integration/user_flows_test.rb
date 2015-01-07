require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
	include Capybara::DSL
  # test "the truth" do
  #   assert true
  # end

  test "signup and log in and create new target" do
  	# 注册流程
  	visit root_path
  	within '#sign-up' do
  		fill_in '用户名', with: "ex0am"
  		fill_in '邮箱', with: "ex0@am.ple"
  		fill_in '密码', with: "111111"
  		fill_in '确认密码', with: "111111"
  		click_button 'signup'
  	end
  	assert_equal targets_path, current_path
  	# 登出
  	click_link '登出'
  	# 登录
  	visit root_path
  	within '#sign-in' do
	  	fill_in '邮箱', with: 'ex0@am.ple'
	  	fill_in '密码', with: '111111'
	  	click_button 'login'
	  end
	  assert_equal targets_path, current_path

	  # 创建目标
	  visit new_target_path
	  fill_in '目标标题', with: "Target Name"
	  fill_in '目标描述', with: "Target Detail"
	  select '学习', from: '目标分类'
	  fill_in '开始时间', with: '2015-01-10'
	  fill_in '结束时间', with: '2015-01-20'
	  click_button '提交'
	  assert_equal target_path(Target.last), current_path
  end

end