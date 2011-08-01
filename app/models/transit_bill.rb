#coding: utf-8
#中转机打运单
class TransitBill < CarryingBill
  validates :transit_org_id,:to_area,:bill_no,:goods_no,:presence => true
end
