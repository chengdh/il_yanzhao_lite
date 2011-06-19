#coding: utf-8
class TransitDeliverInfosController < BaseController
  table :bill_date,:org,:user,:note,:human_state_name
  def create
    @transit_deliver_info = TransitDeliverInfo.new(params[:transit_deliver_info])
    @transit_deliver_info.carrying_bill_ids  = params[:bill_ids]  unless params[:bill_ids].blank?
    @transit_deliver_info.carrying_bills.each_with_index do |bill,index|
      bill.transit_hand_fee = params[:transit_hand_fee_edit][index]
      bill.commission = params[:commission_edit][index] if params[:commission_edit].present?
      bill.send_fee = params[:send_fee_edit][index]
    end
    @transit_deliver_info.process
    create!
  end
  #GET search
  #显示查询窗口
  def search
    render :partial => "search"
  end
end
