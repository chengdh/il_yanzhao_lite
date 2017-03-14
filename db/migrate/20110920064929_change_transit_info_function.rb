#coding: utf-8
class ChangeTransitInfoFunction < ActiveRecord::Migration
  def self.up
    #添加货物中转的update功能
    sf = SystemFunction.find_by_subject_title("货物中转")
    func_obj =  {
      :subject => "TransitInfo",
      :action => :update
    }
    if sf.present?
      ops = sf.system_function_operates.find_or_create_by_name("修改")
      ops.update_attributes(:function_obj => func_obj)
    end
    #运单重置功能
    sf = SystemFunction.find_by_subject_title("运单修改")
    func_obj =  {
      :subject => "CarryingBill",
      :action => :reset
    }
    if sf.present?
      ops = sf.system_function_operates.find_or_create_by_name("重置运单")
      ops.update_attributes(:function_obj => func_obj)
    end
  end

  def self.down
  end
end
