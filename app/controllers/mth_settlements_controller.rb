# coding: utf-8

# 月结算表controller
class MthSettlementsController < BaseController
  table :mth, :total_commission_fee, :total_insured_fee, :total_income, :total_cost_fee, :total_vehicle_fee, :total_load_fee, :total_cost, :total_profit, :total_to_carrying_fee, :total_from_carrying_fee, :user
  def new
    @mth_settlement = MthSettlement.new
    Org.branch_list.each do |b|
      line = MthSettlementLine.new(:org => b)
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
    search_params = { :mth_eq => last_mth }
    params[:search] = {} if params[:search].blank?
    params[:search].deep_merge!(search_params) if params[:search].blank?

    @mth_settlement = MthSettlement.search(params[:search]).try(:first)
  end
  #导出查询结果为excel
  #GET mth_settlements/:id/export_excel
  def export_excel
    @mth_settlement = MthSettlement.find(params[:id])
    xls = render_to_string(:partial => "excel",:layout => false)
    send_data xls,:filename => "月费用结算清单.xls"
  end
  #GET search
  #显示查询窗口
  def search
    render :partial => "search"
  end

end
