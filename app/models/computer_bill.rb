#coding: utf-8
#机打票
class ComputerBill < CarryingBill
  #创建/修改数据前生成票据编号和货号
  validates_presence_of :to_org_id
end
