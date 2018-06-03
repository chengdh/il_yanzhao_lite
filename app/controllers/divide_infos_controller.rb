#coding: utf-8
#分部返款明细表
class DivideInfosController < BaseController
  table :org,:bill_mth,:user,:sum_in_fee,:sum_out_fee,:sum_other_fee,:sum_act_fee
  def new
    @divide_info = DivideInfo.new_with_lines
  end

  #导出查询结果为excel
  #GET divide_infos/:id/export_excel
  def export_excel
    @divide_info = DivideInfo.find(params[:id])
    xls = render_to_string(:partial => "excel",:layout => false)
    send_data xls,:filename => "返款明细表.xls"
  end
  #GET search
  #显示查询窗口
  def search
    render :partial => "search"
  end
end
