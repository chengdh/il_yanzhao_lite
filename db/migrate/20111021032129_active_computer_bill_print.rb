class ActiveComputerBillPrint < ActiveRecord::Migration
  def self.up
    #激活手工运单
    sf = SystemFunction.find_by_subject_title('运单录入')
    sf.update_attributes(:subject_title => "机打运单录入") if sf
    sf = SystemFunction.find_by_subject_title('手工运单录入')
    sf.update_attributes(:is_active => true) if sf
    sf = SystemFunction.find_by_subject_title('手工中转运单录入')
    sf.update_attributes(:is_active => true) if sf
  end

  def self.down
  end
end
