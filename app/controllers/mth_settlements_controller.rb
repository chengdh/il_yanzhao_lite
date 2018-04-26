#coding: utf-8
class MthSettlementsController < BaseController
  table :mth,:sum_to_carrying_fee,:sum_from_carrying_fee,:sum_commission_fee,:sum_insured_fee,:sum_income_fee,:user
  def new
    @mth_settlement = MthSettlement.new
    Org.branch_list.each do |b|
      @mth_settlement.mth_settlement_lines.build(:org => b)
    end
  end
end