# coding: utf-8

# 月费用结算单
class MthSettlement < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :mth_settlement_lines, :dependent => :destroy
  accepts_nested_attributes_for :mth_settlement_lines, :allow_destroy => true

  default_value_for :mth do
    Time.zone.today.months_ago(1).strftime('%Y%m')
  end

  # 运费合计
  def total_from_carrying_fee
    mth_settlement_lines.to_a.sum(&:from_carrying_fee)
  end

  # 返程合计
  def total_to_carrying_fee
    mth_settlement_lines.to_a.sum(&:to_carrying_fee)
  end

  # 保险费合计
  def total_insured_fee
    mth_settlement_lines.to_a.sum(&:insured_fee)
  end

  # 提成合计
  def total_commission_fee
    mth_settlement_lines.to_a.sum(&:commission_fee)
  end

  # 收入合计
  def total_income
    total_commission_fee + total_insured_fee
  end


  # 费用支出
  def total_cost_fee
    mth_settlement_lines.to_a.sum(&:cost_fee)
  end

  # 大车费合计
  def total_vehicle_fee
    mth_settlement_lines.to_a.sum(&:vehicle_fee)
  end

  # 装卸费合计
  def total_load_fee
    mth_settlement_lines.to_a.sum(&:load_fee)
  end

  # 费用合计
  def total_cost
    total_cost_fee + total_vehicle_fee + total_load_fee
  end

  # 利润
  def total_profit
    total_income - total_cost
  end
end
