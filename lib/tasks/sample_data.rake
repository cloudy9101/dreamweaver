namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Category.create!(name: "工作")
    Category.create!(name: "生活")
    Category.create!(name: "学习")
    Category.create!(name: "健康")
    10.times do |n|
      User.create!(
        email: "ex#{n}@am.ple",
        password: "111111",
        name: "exam#{n}"
        )
    end
    User.all.each do |u|
      3.times do |n|
        u.abstract_targets.new(
          name: "示例目标-#{u.name}-#{n}",
          detail: "示例目标详细内容-#{u.name}-#{n}",
          category_id: n + 1,
          great: n / 2 == 0,
          ).save
      end
      u.abstract_targets.each do |a|
        a.targets.new(
          start_time: "2015-01-24",
          finish_time: "2015-02-24",
          user_id: u.id
          ).save
      end
      u.targets.each do |t|
        t.days.new(
          date_at: Date.today,
          comment: "示例打卡",
          user_id: u.id
          ).save
      end
    end
  end
end