#coding: utf-8
class AddVehicleFeeFunctions < ActiveRecord::Migration
  def self.up
    group_name = "费用管理"
    subject_title = "大车费用记账"
    subject = "VehicleFee"
    sf_hash = {

      :group_name => group_name,
      :subject_title => subject_title,
      :subject => subject,
      :default_action => 'vehicle_fees_path(:sort => "fee_date",:direction => "desc")',
      :function => {
        :read => {:title => "查看"},
        :create => {:title => "新建"},
        :edit_to_org => {:title => "录入到货地"},
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
