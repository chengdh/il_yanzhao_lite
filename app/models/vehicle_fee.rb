#coding: utf-8
#大车费用
class VehicleFee < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  validates :org_id,:user_id, presence: true
  has_many :vehicle_fee_lines,:dependent => :destroy
  accepts_nested_attributes_for :vehicle_fee_lines,:allow_destroy => true,:reject_if => proc {|attrs| attrs['v_no'].blank? or attrs['load_fee'].to_f <= 0 }

  default_value_for :fee_date do
    1.days.ago.to_date
  end

  #总运费
  def sum_load_fee
    vehicle_fee_lines.sum(:load_fee)
  end

  #总车次
  def sum_vehicle_count
    vehicle_fee_lines.sum(1)
  end

  #月费用合计
  def self.sum_vehicle_fee_by_org_and_mth(org_id,mth)
    f_day = Date.parse("#{mth}01")
    t_day = f_day.end_of_month
    VehicleFeeLine.search(:vehicle_fee_org_id_eq => org_id,:vehicle_fee_fee_date_gte => f_day,:vehicle_fee_fee_date_lte => t_day).sum(:load_fee)
  end

  #月发车费用合计
  def self.sum_vehicle_fee_from_summary_org(to_org_id,mth)
    f_day = Date.parse("#{mth}01")
    t_day = f_day.end_of_month
    VehicleFeeLine.search(:to_org_id_eq => to_org_id,:vehicle_fee_fee_date_gte => f_day,:vehicle_fee_fee_date_lte => t_day).sum(:load_fee)
  end

  #到货地实付费用
  def self.sum_vehicle_fee_by_to_org_and_mth(to_org_id,mth)
    f_day = Date.parse("#{mth}01")
    t_day = f_day.end_of_month
    VehicleFeeLine.search(:to_org_id_is_null => true,:vehicle_fee_org_id_eq => to_org_id,:vehicle_fee_fee_date_gte => f_day,:vehicle_fee_fee_date_lte => t_day).sum(:load_fee)
  end

  #大车运费对比表
  def self.mth_rpt(mth)
    ret = {}
    Org.branch_list.each do |b|
      plan_fee = sum_vehicle_fee_from_summary_org(b.id,mth)
      act_fee = sum_vehicle_fee_by_to_org_and_mth(b.id,mth)
      ret[b] = [plan_fee,act_fee]
    end
    ret
  end
end
