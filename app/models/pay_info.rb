#coding: utf-8
class PayInfo < ActiveRecord::Base
  has_many :carrying_bills,:order => "from_org_id ASC,bill_date ASC,bill_no ASC"

  belongs_to :org
  belongs_to :user
  validates_presence_of :customer_name

  #定义状态机
  state_machine :initial => :billed do
    after_transition do |pay_info,transition|
      pay_info.carrying_bills.each {|bill| bill.standard_process}
    end
    event :process do
      transition :billed =>:paid
    end
  end

  default_value_for :bill_date do
    Date.today
  end
  #合计货款
  def sum_goods_fee
    self.carrying_bills.sum(:goods_fee)
  end
  #合计扣手续费
  def sum_k_hand_fee
    self.carrying_bills.sum(:k_hand_fee)
  end
  #中转手续费
  def sum_transit_hand_fee
    self.carrying_bills.sum(:transit_hand_fee)
  end

  #合计扣运费
  def sum_k_carrying_fee
    self.carrying_bills.to_a.sum(&:k_carrying_fee)
  end
  #合计应付金额
  def sum_act_pay_fee
    self.carrying_bills.to_a.sum(&:act_pay_fee)
  end
  #导出
  def self.to_csv(search_obj)
      search_obj.export_csv(self.export_options)
  end
  private
  def self.export_options
    {
      :only => [],
      :methods => [
        :bill_date,:customer_name,:sum_goods_fee,:sum_k_carrying_fee,:sum_transit_hand_fee,:sum_k_hand_fee,:sum_act_pay_fee,:note
    ]
    }
  end
end
