#coding: utf-8
#手工中转运单
class HandTransitBill < CarryingBill
  validates :transit_org_id,:to_area,:presence => true
  #手工运单,编号从0 ～ 3999999
  #validates_inclusion_of :bill_no,:in => '0000000'..'3999999'
  #20120328 保存前自动在运单编号前加发货地的两个拼音
  before_create :add_bill_no_pre
  private
  def add_bill_no_pre
    #201203287单据号有重复,前边添加字母
    self.bill_no = "#{self.from_org.try(:py)[0..1]}#{self.bill_no}" if self.from_org.try(:py).present?
  end
end
