# coding: utf-8

# 月费用结算单明细
class MthSettlementLine < ActiveRecord::Base
  belongs_to :mth_settlement
  belongs_to :org
  validates :from_carrying_fee, :to_carrying_fee, :insured_fee, :commission_fee, numericality: true
  validates :org_id, presence: true
  def default_cost_fee
    FeeInfo.sum_fee_type_9_by_org_and_mth(org_id, mth_settlement.mth)
  end

  def default_vehicle_fee
    VehicleFee.sum_vehicle_fee_by_org_and_mth(org_id, mth_settlement.mth)
  end

  # 收入合计
  def sum_income
    (commission_fee + insured_fee).to_i
  end

  # 费用合计
  def sum_cost
    (load_fee + vehicle_fee + cost_fee).to_i
  end

  # 利润
  def sum_profit
    (sum_income - sum_cost).to_i
  end
end
