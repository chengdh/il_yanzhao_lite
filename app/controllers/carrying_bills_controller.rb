#coding: utf-8
#运单controller基础类
class CarryingBillsController < BaseController
  #http_cache :new,:last_modified => Proc.new {|c| c.send(:last_modified)},:etag => Proc.new {|c| c.send(:etag,"carrying_bill_new")}
  #判断是否超过录单时间,超过录单时间后,不可再录入票据
  before_filter :check_expire,:only => :new
  before_filter :pre_process_search_params,:only => [:index,:rpt_turnover,:turnover_chart]
  belongs_to :load_list,:distribution_list,:deliver_info,:settlement,:refound,:cash_payment_list,:transfer_payment_list,:cash_pay_info,:transfer_pay_info,:post_info,:transit_info,:transit_deliver_info,:short_fee_info,:polymorphic => true,:optional => true

  #覆盖默认的index方法,主要是为了导出
  def index
    super do |format|
      format.csv {send_data resource_class.to_csv(@search)}
    end
  end
  #导出查询结果为excel
  #GET carrying_bills/export_excel
  def export_excel
    @search = end_of_association_chain.accessible_by(current_ability,:read_with_conditions).search(params[:search]).order(sort_column + ' ' + sort_direction)
    xls = render_to_string(:partial => "shared/carrying_bills/excel",:layout => false)
    send_data xls,:filename => "bill.xls"
  end

  #GET search
  #显示查询窗口
  def search
    render :partial => "shared/carrying_bills/search"
  end
  #简单查询,用于报表统计
  def simple_search
    @search = resource_class.search(params[:search])
  end
  def show
    bill = get_resource_ivar || set_resource_ivar(resource_class.find(params[:id],:include => [:from_org,:to_org,:transit_org,:from_customer,:user]))
    respond_with(bill) do |format|
      format.html
      format.js { render :partial => "shared/carrying_bills/show",:object => bill}
    end
  end
  #重写修改方法
  def update
    bill = get_resource_ivar || set_resource_ivar(resource_class.find(params[:id]))
    original_bill = bill.clone  #保存原始运单信息
    bill.attributes=params[resource_class.model_name.underscore.to_sym]
    logger.debug "original_carrying_fee = #{bill.original_carrying_fee}"
    logger.debug "carrying_fee = #{bill.carrying_fee}"
    authorize! :update_goods_fee,bill,:message => "你无权修改货款!" if can? :update_goods_fee,original_bill
    logger.debug "pass update_goods_fee authorize"
    if can? :update_all,original_bill
      authorize! :update_all,bill,:message => "你无权修改该票据!"
      logger.debug "pass update_goods_fee authorize"

    elsif can? :update_carrying_fee_100,original_bill
      authorize! :update_carrying_fee_100,bill,:message => "你减免运费金额超过100%!"

      logger.debug "pass update_carrying_fee_100 authorize"
    elsif can? :update_carrying_fee_50,original_bill
      authorize! :update_carrying_fee_50,bill,:message => "你运费金额超过50%!"

      logger.debug "pass update_carrying_fee_50 authorize"
    elsif can? :update_carrying_fee_20,original_bill
      authorize! :update_carrying_fee_20, bill,:message => "你减免运费金额超过20%!"
      logger.debug "pass update_carrying_fee_20 authorize"
    end
    update!
  end

  #PUT /carrying_bills/1/reset
  def reset
    bill = get_resource_ivar || set_resource_ivar(resource_class.find(params[:id]))
    bill.reset
    flash[:success] = "运单已成功重置."
    redirect_to bill
  end
  #日/月营业额统计
  def rpt_turnover
    @search = resource_class.where(:from_org_id =>current_user.current_ability_org_ids).turnover.search(params[:search])
    get_collection_ivar || set_collection_ivar(@search.all)
  end
  #营业额统计柱状图
  def turnover_chart
    @search = resource_class.where(:from_org_id =>current_user.current_ability_org_ids).turnover.search(params[:search])
    get_collection_ivar || set_collection_ivar(@search.all)
  end
  #提货票据打印次数
  #PUT carrying_bills/:id/th_bill_print_counter
  def th_bill_print_counter
    bill = resource_class.find(params[:id])
    get_resource_ivar || set_resource_ivar(bill)
    bill.increment!(:th_bill_print_count)
    render :nothing => true
  end

  private
  def check_expire
    if current_user.default_org.input_expire?
      flash[:error]="录单时间截至到#{current_user.default_org.lock_input_time},已过录单时间."
      redirect_to :action => :index
    end
  end
  protected
  def collection
    @search = end_of_association_chain.accessible_by(current_ability,:read_with_conditions).search(params[:search])
    get_collection_ivar || set_collection_ivar(@search.select("DISTINCT #{resource_class.table_name}.*").with_association.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page]))
  end
end
