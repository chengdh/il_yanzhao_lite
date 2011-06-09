#coding: utf-8
#货物中转资料
class TransitInfo < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  belongs_to :transit_company  #中转公司
  has_one :carrying_bill
  validates_presence_of :org_id,:transit_bill_no

  accepts_nested_attributes_for :transit_company

  #定义状态机
  state_machine :initial => :billed do
    after_transition do |transit_info,transition|
      transit_info.carrying_bill.transit_carrying_fee = transit_info.transit_carrying_fee
      transit_info.carrying_bill.transit_bill_no = transit_info.transit_bill_no
      transit_info.carrying_bill.agent_carrying_fee = transit_info.agent_carrying_fee
      transit_info.carrying_bill.standard_process
    end
    event :process do
      transition :billed =>:transited
    end
  end
  default_value_for :bill_date,Date.today

  #虚拟属性,中转运单号
  def transit_bill_no=(transit_bill_no)
    @transit_bill_no = transit_bill_no
  end

  def transit_bill_no
    @transit_bill_no || self.carrying_bill.try(:transit_bill_no)
  end

end
