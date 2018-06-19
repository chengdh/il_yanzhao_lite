#coding: utf-8
#大车装车费用
class VehicleFeesController < BaseController
  table :fee_date,:org,:sum_load_fee,:sum_vehicle_count,:user
  def new
    @vehicle_fee = VehicleFee.new

    #总部录入时,日期默认时当日
    #分公司录入时,日期默认是昨天 车辆是晚发朝至
    @vehicle_fee.fee_date = Date.today if current_user.default_org.is_yard?
    (1..10).each do 
      @vehicle_fee.vehicle_fee_lines.build
    end
  end

  #GET search
  #显示查询窗口
  def search
    render :partial => "search"
  end
  #GET vehicle_fees/mth_rpt
  #大车费用对比表
  def mth_rpt
    last_mth = 1.months.ago.strftime("%Y%m")
    search_params = {:mth_eq => last_mth}
    params[:search] = {} if params[:search].blank?
    params[:search].deep_merge!(search_params) if params[:search].blank?
    @mth_rpt = VehicleFee.mth_rpt(params[:search][:mth_eq])
  end

  #导出查询结果为excel
  #GET vehicle_fees/export_excel
  def export_excel
    @search = end_of_association_chain.where(:org_id => current_user.current_ability_org_ids).search(params[:search])
    xls = render_to_string(:partial => "excel",:layout => false)
    send_data xls,:filename => "大车费用表.xls",:type =>  "application/vnd.ms-excel"
  end


  #重写collection方法-只能看到本机构数据
  protected
  def collection
    @search = end_of_association_chain.where(:org_id => current_user.current_ability_org_ids).search(params[:search])
    get_collection_ivar || set_collection_ivar(@search.select("DISTINCT #{resource_class.table_name}.*").order(sort_column + ' ' + sort_direction).paginate(:page => params[:page]))
  end
end
