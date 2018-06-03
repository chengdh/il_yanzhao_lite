#coding: utf-8
class AddDivideInfoFunction < ActiveRecord::Migration
  def self.up
    group_name = "费用管理"
    #################################运单录入################################################
    subject_title = "返款明细表"
    subject = "DivideInfo"
    sf_hash = {
      :group_name => group_name,
      :subject_title => subject_title,
      :subject => subject,
      :default_action => 'divide_infos_path',
      :function => {
        :read => {:title => "查看"},
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
