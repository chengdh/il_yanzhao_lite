#coding: utf-8
#大车费用明细表
class VehicleFeeLine < ActiveRecord::Base
  belongs_to :vehicle_fee
  belongs_to :to_org,:class_name => "Org"
  validates :load_fee, numericality: true
end
