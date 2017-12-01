#coding： utf-8
#到货清单
class ArriveLoadListsController < LoadListsController
  defaults :resource_class => LoadList, :collection_name => 'load_lists', :instance_name => 'load_list'
  #先跳过基类的验证,然后重写自己的验证
  skip_authorize_resource
  authorize_resource :class => "LoadList",:instance_name => "load_list"


  #显示提货单据打印界面
  #GET arrive_load_list/:id/show_print_th_bill
  def show_print_th_bill
    load_list = resource_class.find(params[:id],:include => [:from_org,:to_org,:user,:carrying_bills])
    get_resource_ivar || set_resource_ivar(load_list)
  end

  protected
  def collection
    @search = end_of_association_chain.accessible_by(current_ability,:read_arrive).search(params[:search])
    get_collection_ivar || set_collection_ivar(@search.select("DISTINCT #{resource_class.table_name}.*").order(sort_column + ' ' + sort_direction).paginate(:page => params[:page]))
  end
end
