# coding: utf-8

# 月结算表controller
class MthSettlementsController < BaseController
  table :mth, :sum_to_carrying_fee, :sum_from_carrying_fee, :sum_commission_fee,
        :sum_insured_fee, :sum_income, :user
  def new
    @mth_settlement = MthSettlement.new
    Org.branch_list.each do |b|
      line = MthSettlementLine.new(org: b)
      @mth_settlement.mth_settlement_lines << line
      line.mth_settlement = @mth_settlement
      line.cost_fee = line.default_cost_fee
      line.vehicle_fee = line.default_vehicle_fee
    end
  end

  # GET mth_settlements/mth_rpt
  # 月财务收支明细表
  def mth_rpt
    last_mth = 1.month.ago.strftime('%Y%m')
    search_params = { mth_eq: last_mth }
    params[:search] = {} if params[:search].blank?
    params[:search].deep_merge!(search_params) if params[:search].blank?

    @mth_settlement = MthSettlement.search(params[:search]).try(:first)
  end
end
