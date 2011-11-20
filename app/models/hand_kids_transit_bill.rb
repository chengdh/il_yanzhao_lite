#coding: utf-8
#手工童装运单
class HandKidsTransitBill < CarryingBill
  validates :transit_org_id,:to_area,:presence => true
  #手工童装运单,编号从0 ～ 3999999
  validates_inclusion_of :bill_no,:in => '0000000'..'3999999'
end
