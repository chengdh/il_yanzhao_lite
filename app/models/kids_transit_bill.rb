class KidsTransitBill < CarryingBill
  validates :transit_org_id,:to_area,:presence => true
end
