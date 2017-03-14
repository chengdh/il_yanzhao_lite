#coding: utf-8
class AddHandKidsTransitBill < ActiveRecord::Migration
  def self.up
    ##############################手工运单录入#################################################
    #配送管理模块
    group_name = "配送管理"

    subject_title = "手工童装运单录入"
    subject = "HandKidsTransitBill"
    sf_hash = {
      :group_name => group_name,
      :subject_title => subject_title,
      :subject => subject,
      :default_action => 'can?(:create,HandKidsTransitBill) ? new_hand_kids_transit_bill_path : hand_kids_transit_bills_path("search[from_org_id_in]" => current_user.current_ability_org_ids,"search[completed_eq]" => 0,"search[bill_date_eq]" => Date.today,:sort => "carrying_bills.bill_date desc,goods_no",:direction => "asc")',
      :function => {
      :create => {:title => "新建"},
      :update_all =>{:title =>"修改",:conditions =>"{:state => ['loaded','billed'],:from_org_id => user.current_ability_org_ids}"},
      :destroy => {:title => "删除",:conditions =>"{:state => ['loaded','billed'],:from_org_id => user.current_ability_org_ids}"},
      :export => {:title => "导出"}
    }
    }
    SystemFunction.create_by_hash(sf_hash) unless SystemFunction.exists?(:subject_title => "手工童装运单录入")
  end

  def self.down

  end
end
