#coding: utf-8
class SettlementsController < BaseController
  table :org,:bill_date,:sum_goods_fee,:sum_carrying_fee,:user,:human_state_name,:note
  include BillOperate
  def new
    @settlement = Settlement.new
    @settlement = Settlement.new_with_org_id if params[:settlement].present?
  end
  #GET search
  #显示查询窗口
  def search
    render :partial => "search"
  end
  def show
    super do |format|
      format.csv {send_data resource.to_csv}
    end
  end
  #GET load_list/1/export_excel
  def export_excel
    @settlement = resource_class.find(params[:id],:include => [:org,:user,:carrying_bills])
  end
end

