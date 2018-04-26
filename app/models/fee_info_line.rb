#coding: utf-8
#流水账明细
class FeeInfoLine < ActiveRecord::Base
  belongs_to :fee_info
  validates :fee, numericality: true
  validates :fee_note, presence: true
  default_value_for :fee_type,9

  def fee_type_des
    ret = ""
    ret = "收入" if fee_type == 1
    ret = "费用" if fee_type == 9
    ret
  end
end
