#coding: utf-8
#中转机打运单
class TransitBill < CarryingBill
  before_validation :generate_bill_no,:on => :create

  validates :bill_no,:goods_no,:transit_org_id,:to_area,:presence => true

end
