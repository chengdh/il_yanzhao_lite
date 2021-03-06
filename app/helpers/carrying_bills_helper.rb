#coding: utf-8
module CarryingBillsHelper
  #运费支付方式显示
  def pay_type_des(pay_type)
    pay_type_des = ""
    CarryingBill.pay_types.each {|des,code| pay_type_des = des if code == pay_type }
    pay_type_des
  end
  #票据状态
  def states_for_select
    CarryingBill.state_machine.states.collect{|state| [state.human_name,state.value] }
  end
  #得到查询对象的id数组
  def search_ids
    @search.select("carrying_bills.id,carrying_bills.from_org_id").map {|bill| bill.id }.to_json
  end
  #得到票据合计信息
  def search_sum
    sum_info = CarryingBill.search_sum(@search)
    sum_info
  end
  #得到滞留天数对应的class
  #4天之内为白色，5—8天为兰色，9—12天为绿色，13—16天为黄色，17—20天为红色，21天后全部为黑色。
  def stranded_class(days)
    ret_class=''
    ret_class="white-bill" if days <= 4
    ret_class="blue-bill" if days >= 4 and days <= 8
    ret_class="green-bill" if days >= 9 and days <= 12
    ret_class="yellow-bill" if days >= 13 and days <= 16
    ret_class="red-bill" if days >= 17 and days <= 20
    ret_class="black-bill" if days >= 21
    ret_class
  end
  #货物信息列表
  def goods_infos_for_select
    [['手套','手套'],['童装','童装'],['劳保用品','劳保用品'],['衣服','衣服'],['电器','电器'],['其他','其他'],['手动录入',-1]]
  end
  #生成show_fields/hide_fields字段显示
  def gen_fields_selector(fields_selector='',show=true)
    css_array =[]
    css_array << (show ? params[:show_fields] : params[:hide_fields]) << fields_selector
      css_array.delete_if {|x| x.blank?}
    css_array.join(',')
  end
  #得到运单修改css class
  def get_bill_update_class(resource)
    can_update =[]
    if can?(:update_all,resource)
      can_update << 'update_all'
    else
      can_update <<  'update_carrying_fee' if can?(:update_carrying_fee_20,resource) or can?(:update_carrying_fee_50,resource) or can?(:update_carrying_fee_100,resource)
      can_update << 'update_goods_fee' if can?(:update_goods_fee,resource)
    end
    can_update=[] if resource.new_record?
    can_update.join(' ')
  end
end
