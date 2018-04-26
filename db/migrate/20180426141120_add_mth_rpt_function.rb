#coding: utf-8
class AddMthRptFunction < ActiveRecord::Migration
  def self.up
    group_name = "费用管理"
    #################################运单录入################################################
    subject_title = "财务收支分析表"
    subject = "MthSettlement"
    sf_hash = {
      :group_name => group_name,
      :subject_title => subject_title,
      :subject => subject,
      :default_action => 'mth_rpt_mth_settlements_path("search[mth_eq]"=> Date.today.months_ago(1).strftime("%Y%m"))',
    
      :function => {
        :mth_rpt => {:title => "财务收支分析表"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)

  end

  def self.down
  end
end
