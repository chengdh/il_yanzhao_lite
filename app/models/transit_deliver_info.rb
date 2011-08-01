#coding: utf-8
class TransitDeliverInfo < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :carrying_bills,:order => "from_org_id ASC,bill_date ASC,bill_no ASC"

  validates_presence_of :org_id

  #定义状态机
  state_machine :initial => :billed do
    after_transition do |deliver,transition|
      deliver.carrying_bills.each {|bill| bill.standard_process }
    end
    event :process do
      transition :billed =>:deliveried
    end
  end

  default_value_for :bill_date do
    Date.today
  end
end
