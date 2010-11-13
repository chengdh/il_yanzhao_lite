#coding: utf-8 require 'faker'

namespace :db do
  desc "向数据库中添加示例数据"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    zz_branch = Branch.create!(:name => "郑州公司",
                               :simp_name => "郑",
                               :manager => "李保庆",
                               :location => "南四环十八里河")
    ('A'..'Z').each do |n|
      zz_branch.children.create(:name => n,:simp_name => n)
    end
    %w[
    邱县 焦作 永年 馆陶 三门峡 洛阳 周口 肥乡 广平 成安 长治 石家庄 水冶 偃师 许昌 曲周 濮阳 新乡
    魏县
    驻马店
    宁晋
    晋城
    双桥
    肉联厂
    磁县
    漯河
    临漳
    沙河
    涉县
    大名
    鸡泽
    侯马
    峰峰
    武安
    邯郸
    邢台].each do |name|
      Branch.create!(:name => name,:simp_name => name.first,:location => name)
    end
  end
end
