#coding: utf-8
#月费用结算单
class MthSettlement < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :mth_settlement_lines
  accepts_nested_attributes_for :mth_settlement_lines,:allow_destroy => true

  default_value_for :mth do
    Date.today.months_ago(1).strftime("%Y%m")
  end

  #运费合计
  def sum_from_carrying_fee
    mth_settlement_lines.sum(:from_carrying_fee)
  end

  #返程合计
  def sum_to_carrying_fee
    mth_settlement_lines.sum(:to_carrying_fee)
  end

  #保险费合计
  def sum_insured_fee
    mth_settlement_lines.sum(:insured_fee)
  end

  #提成合计
  def sum_commission_fee
    mth_settlement_lines.sum(:commission_fee)
  end

  #收入合计
  def sum_income
    sum_commission_fee + sum_insured_fee
  end

  #费用支出
  def sum_fee
    mth_settlement_lines.to_a.sum(&:sum_fee)
  end

  #大车费合计
  def sum_load_fee
    mth_settlement_lines.to_a.sum(&:sum_load_fee)
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
