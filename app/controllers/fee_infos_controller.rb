#coding: utf-8
#流水账
class FeeInfosController < BaseController
  table :fee_date,:org,:sum_fee_type_1,:sum_fee_type_9,:sum_fee,:user
  def new
    @fee_info = FeeInfo.new
    (1..10).each do 
      @fee_info.fee_info_lines.build
    end
  end
  #GET search
  #显示查询窗口
  def search
    render :partial => "search"
  end

  #导出查询结果为excel
  #GET fee_infos/export_excel
  def export_excel
    @search = end_of_association_chain.where(:org_id => current_user.current_ability_org_ids).search(params[:search])
    # xls = render_to_string(:partial => "excel",:layout => false)
    # send_data xls,:filename => "流水账.xls"
  end

  #重写collection方法-只能看到本机构数据
  protected
  def collection
    @search = end_of_association_chain.where(:org_id => current_user.current_ability_org_ids).search(params[:search])
    get_collection_ivar || set_collection_ivar(@search.select("DISTINCT #{resource_class.table_name}.*").order(sort_column + ' ' + sort_direction).paginate(:page => params[:page]))
  end
end
