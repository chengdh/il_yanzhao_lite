#coding: utf-8
#大车费用
class VehicleFee < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  validates :org_id,:user_id, presence: true
  has_many :vehicle_fee_lines,:dependent => :destroy
  accepts_nested_attributes_for :vehicle_fee_lines,:allow_destroy => true,:reject_if => proc {|attrs| attrs['v_no'].blank? or attrs['load_fee'].to_f <= 0 }

  default_value_for :fee_date do
    Date.today
  end

  #总运费
  def sum_load_fee
    vehicle_fee_lines.sum(:load_fee)
  end

  #总车次 
  def sum_vehicle_count
    vehicle_fee_lines.sum(1)
  end
end
