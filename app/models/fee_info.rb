#coding: utf-8
#流水账记录
class FeeInfo < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :fee_info_lines
  validates :org_id,:user_id, presence: true
  accepts_nested_attributes_for :fee_info_lines,:allow_destroy => true,:reject_if => proc { |attrs| attrs['fee_note'].blank? or attrs['fee'].to_f <=0 }
  default_value_for :fee_date do 
    Date.today
  end

  def sum_fee
    fee_info_lines.sum(:fee)
  end

  #支出合计
  def sum_fee_type_9
    fee_info_lines.where(:fee_type => 9).sum(:fee)
  end

  #收入合计
  def sum_fee_type_1
    fee_info_lines.where(:fee_type => 1).sum(:fee)
  end


end
