#coding: utf-8
#添加月费用结算清单功能
class AddMthSettlementFunction < ActiveRecord::Migration
  def self.up
    group_name = "费用管理"
    #################################运单录入################################################
    subject_title = "月费用结算清单"
    subject = "MthSettlement"
    sf_hash = {
      :group_name => group_name,
      :subject_title => subject_title,
      :subject => subject,
      :default_action => 'mth_settlements_path(:sort => "mth",:direction => "desc")',
      :function => {
        :create => {:title => "新建"},
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
