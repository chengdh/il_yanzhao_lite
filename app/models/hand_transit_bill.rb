#coding: utf-8
#手工中转运单
class HandTransitBill < CarryingBill
  validates :transit_org_id,:to_area,:presence => true
end
