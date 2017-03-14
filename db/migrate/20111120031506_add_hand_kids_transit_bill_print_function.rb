#coding: utf-8
class AddHandKidsTransitBillPrintFunction < ActiveRecord::Migration
  def self.up
    #添加短途运费核销功能
    sf = SystemFunction.find_by_subject_title('童装运单录入')
    func_obj =  {
      :subject => "KidsTransitBill",
      :action => :print,
      :conditions =>"{:state => 'billed'}"
    }

    if sf
      ops = sf.system_function_operates.find_or_create_by_name("票据打印")
      ops.update_attributes(:function_obj => func_obj)
    end
  end

  def self.down
    sf = SystemFunction.find_by_subject_title('童装运单录入')
    if sf
      ops = sf.system_function_operates.find_by_name("票据打印")
      ops.destroy if ops
    end

  end
end
