class KidsTransitBill < CarryingBill
  validates :transit_org_id,:to_area,:bill_no,:goods_no,:presence => true
end
