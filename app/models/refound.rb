#coding: utf-8
#返款清单
class Refound < ActiveRecord::Base
  belongs_to :user
  has_many :carrying_bills,:order => "from_org_id ASC,bill_date ASC,bill_no ASC"

  belongs_to :from_org,:class_name => "Org"
  belongs_to :to_org,:class_name => "Org"
  has_one :remittance
  validates_presence_of :bill_date,:from_org_id,:to_org_id

  #待确认付款清单
  scope :refunded,lambda {|to_org_ids| select("sum(1) as bill_count").where(:state => :refunded,:to_org_id => to_org_ids)}
  #定义状态机
  state_machine :initial => :billed do
    after_transition do |refound,transition|
      refound.carrying_bills.each {|bill| bill.standard_process}
    end
    event :process do
      transition :billed =>:refunded,:refunded => :refunded_confirmed
    end
  end

  default_value_for :bill_date do
    Date.today
  end
  #合计收取手续费金额
  def sum_k_hand_fee
    self.carrying_bills.sum(:k_hand_fee)
  end
  def sum_k_hand_fee=(val)
  end

  #合计应返款金额
  def sum_fee
    self.sum_goods_fee - self.sum_k_hand_fee
  end
  def sum_fee=(val)
  end
  #导出到csv
  def to_csv
    ret = ["返款日期:",self.bill_date,"付款单位:",self.from_org.name,"收款单位:",self.to_org.name,"结算员:",self.user.try(:username)].export_line_csv(true)
    ret = ret + ["提付运费:",self.sum_carrying_fee,"代收货款:",self.sum_goods_fee,"合计:",self.sum_fee].export_line_csv
    ret = ret + ["备注:",self.note,"状态",self.human_state_name ].export_line_csv
    csv_carrying_bills = CarryingBill.to_csv(self.carrying_bills.search,Refound.carrying_bill_export_options,false)
    ret + csv_carrying_bills
  end
  private
  def self.carrying_bill_export_options
    {
        :only => [],
        :methods => [
          :bill_date,:bill_no,:goods_no,:from_customer_name,:from_customer_phone,:from_customer_mobile,
          :to_customer_name,:to_customer_phone,:to_customer_mobile,
          :pay_type_des,
          :carrying_fee_th,:goods_fee,:insured_fee,
          :note,:human_state_name
      ]}
  end
end
