#coding: utf-8
class AddMthRptForVehicleFee < ActiveRecord::Migration
  def self.up
    group_name = "费用管理"
    #################################运单录入################################################
    subject_title = "大车费用对比表"
    subject = "VehicleFee"
    sf_hash = {
      :group_name => group_name,
      :subject_title => subject_title,
      :subject => subject,
      :default_action => 'mth_rpt_vehicle_fees_path("search[mth_eq]"=> Date.today.months_ago(1).strftime("%Y%m"))',
      :function => {
        :mth_rpt => {:title => "大车费用对比表"}
      }
    }
    SystemFunction.create_by_hash(sf_hash)
  end

  def self.down
  end
end
