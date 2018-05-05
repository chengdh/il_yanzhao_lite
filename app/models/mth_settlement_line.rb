#coding: utf-8
#月费用结算单明细
class MthSettlementLine < ActiveRecord::Base
  belongs_to :mth_settlement
  belongs_to :org
  validates :from_carrying_fee,:to_carrying_fee,:insured_fee,:commission_fee, :numericality => true
  validates :org_id, :presence => true

  #收入合计
  def sum_income
    commission_fee + insured_fee
  end

  #费用合计
  def sum_fee
    FeeInfo.sum_fee_type_9_by_org_and_mth(org_id,mth_settlement.mth)
  end

  #大车费合计
  def sum_load_fee
    VehicleFee.sum_vehicle_fee_by_org_and_mth(org_id,mth_settlement.mth)
  end

  #费用合计
  def sum_cost
    sum_fee + sum_load_fee
  end

  #利润
  def sum_profit
    sum_income - sum_cost
  end
end
