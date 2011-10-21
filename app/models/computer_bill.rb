#coding: utf-8
#机打票
class ComputerBill < CarryingBill
  validates :to_org_id,:bill_no,:goods_no,:presence => true
  #创建/修改数据前生成票据编号和货号
  before_validation :generate_bill_no,:on => :create
end
