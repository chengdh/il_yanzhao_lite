#coding: utf-8
#流水账记录
class FeeInfo < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :fee_info_lines
  validates :org_id,:user_id, :presence => true
  accepts_nested_attributes_for :fee_info_lines,:allow_destroy => true,:reject_if => proc { |attrs| attrs['fee_note'].blank? or attrs['fee'].to_f <=0 }
  default_value_for :fee_date do 
    Date.today
  end

  def sum_fee
    sum_fee_type_1 - sum_fee_type_9
  end

  #支出合计
  def sum_fee_type_9
    fee_info_lines.where(:fee_type => 9).sum(:fee)
  end

  #收入合计
  def sum_fee_type_1
    fee_info_lines.where(:fee_type => 1).sum(:fee)
  end

  #月费用合计
  def self.sum_fee_type_9_by_org_and_mth(org_id,mth)
    f_day = Date.parse("#{mth}01")
    t_day = f_day.end_of_month

    FeeInfoLine.where(:fee_type => 9).search(:fee_info_org_id_eq => org_id,:fee_info_fee_date_gte => f_day,:fee_info_fee_date_gte => t_day).sum(:fee)
  end

  #月收入合计
  def self.sum_fee_type_1_by_org_and_mth(org_id,mth)
    f_day = Date.parse("#{mth}01")
    t_day = f_day.end_of_month

    FeeInfoLine.where(:fee_type => 1).search(:fee_info_org_id_eq => org_id,:fee_info_fee_date_gte => f_day,:fee_info_fee_date_gte => t_day).sum(:fee)
  end
end
