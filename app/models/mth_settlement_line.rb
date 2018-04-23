#coding: utf-8
#月费用结算单明细
class MthSettlementLine < ActiveRecord::Base
  belongs_to :mth_settlement
  belongs_to :org
  validates :from_carrying_fee,:to_carrying_fee,:insured_fee,:commission_fee, numericality: true
  validates :org_id, presence: true

  def sum_line
    commission_fee + insured_fee
  end
end
