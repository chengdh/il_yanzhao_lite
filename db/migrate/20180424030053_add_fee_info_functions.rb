#coding: utf-8
class AddFeeInfoFunctions < ActiveRecord::Migration
  def self.up
    group_name = "费用管理"
    #################################运单录入################################################
    subject_title = "日记账"
    subject = "FeeInfo"
    sf_hash = {
      :group_name => group_name,
      :subject_title => subject_title,
      :subject => subject,
      :default_action => 'fee_infoes_path(:sort => "fee_date",:direction => "desc")',
      :function => {
        :read => {:title => "查看"},
        :create => {:title => "新建"},
        :create_income => {:title => "录入收入"},
        :update =>{:title =>"修改"},
        :destroy => {:title => "删除"},
        :export => {:title => "导出"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end

  def self.down
  end
end
