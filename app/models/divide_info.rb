#coding: utf-8
#分布返款明细表
class DivideInfo < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  validates :org_id,:bill_date,:bill_mth, :presence => true
  has_many :divide_info_lines,:dependent => :destroy
  accepts_nested_attributes_for :divide_info_lines,:reject_if => proc { |attrs| attrs['item_name'].blank? }

  default_value_for :bill_date do
    Date.today
  end
  default_value_for :bill_mth do
    Time.zone.today.months_ago(1).strftime('%Y%m')
  end

  #创建默认对象
  def self.new_with_lines
    divide_info = DivideInfo.new
    DivideInfoLine::DEFAULT_IN_FEE_ITEMS.each do |item_name|
      divide_info.divide_info_lines.build(:item_name => item_name,:item_type => DivideInfoLine::ITEM_TYPE_IN_FEE)
    end
    #添加空行
    (1..10 - DivideInfoLine::DEFAULT_IN_FEE_ITEMS.size).each do |i|
      divide_info.divide_info_lines.build(:item_type => DivideInfoLine::ITEM_TYPE_IN_FEE)
    end

    DivideInfoLine::DEFAULT_OUT_FEE_ITEMS.each do |item_name|
      divide_info.divide_info_lines.build(:item_name => item_name,:item_type => DivideInfoLine::ITEM_TYPE_OUT_FEE)
    end
    #添加空行
    (1..10 - DivideInfoLine::DEFAULT_OUT_FEE_ITEMS.size).each do |i|
      divide_info.divide_info_lines.build(:item_type => DivideInfoLine::ITEM_TYPE_OUT_FEE)
    end

    DivideInfoLine::DEFAULT_OTHER_FEE_ITEMS.each do |item_name|
      divide_info.divide_info_lines.build(:item_name => item_name,:item_type => DivideInfoLine::ITEM_TYPE_OTHER_FEE)
    end
    #添加空行
    (1..10 - DivideInfoLine::DEFAULT_OTHER_FEE_ITEMS.size).each do |i|
      divide_info.divide_info_lines.build(:item_type =>  DivideInfoLine::ITEM_TYPE_OTHER_FEE)
    end
    divide_info
  end
  #收入明细
  def in_fee_lines
    divide_info_lines.to_a.select{|line| line.item_type.eql?(DivideInfoLine::ITEM_TYPE_IN_FEE) }
  end

  #扣款明细
  def out_fee_lines
    divide_info_lines.to_a.select{|line| line.item_type.eql?(DivideInfoLine::ITEM_TYPE_OUT_FEE) }
  end

  #其他收入
  def other_fee_lines
    divide_info_lines.to_a.select{|line| line.item_type.eql?(DivideInfoLine::ITEM_TYPE_OTHER_FEE) }
  end
  def sum_carrying_fee
    divide_info_lines.where(:item_name => "总货量",:item_type => DivideInfoLine::ITEM_TYPE_IN_FEE).sum(:item_amt)
  end
  def sum_in_fee
    sum_fee = divide_info_lines.where(:item_type => DivideInfoLine::ITEM_TYPE_IN_FEE).sum(:item_amt)
    #NOTE 去除总货量
    sum_fee - sum_carrying_fee
  end
  def sum_out_fee
    divide_info_lines.where(:item_type => DivideInfoLine::ITEM_TYPE_OUT_FEE).sum(:item_amt)
  end
  def sum_other_fee
    divide_info_lines.where(:item_type => DivideInfoLine::ITEM_TYPE_OTHER_FEE).sum(:item_amt)
  end
  def sum_act_fee
    sum_in_fee + sum_other_fee - sum_out_fee
  end
end
