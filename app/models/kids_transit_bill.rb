#coding: utf-8
#机打童装运单
class KidsTransitBill < CarryingBill
  validates :transit_org_id,:to_area,:presence => true
  #创建/修改数据前生成票据编号和货号
  before_validation :generate_bill_no,:on => :create
end
