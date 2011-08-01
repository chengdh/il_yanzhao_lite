#coding: utf-8
#机打票
class ComputerBill < CarryingBill
  validates_presence_of :to_org_id,:bill_no,:goods_no
 end
