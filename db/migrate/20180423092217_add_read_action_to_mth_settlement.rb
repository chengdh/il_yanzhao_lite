#coding: utf-8
class AddReadActionToMthSettlement < ActiveRecord::Migration
  def self.up
    sf = SystemFunction.find_by_subject_title('月费用结算清单')
    if sf.present?
      sfo = sf.system_function_operates.find_or_create_by_name('查看')
      sfo.function_obj = {
        :subject => "MthSettlement",
        :action => :read
      }
      sfo.save!
  end
  end

  def self.down
  end
end
