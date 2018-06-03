#coding: utf-8
#分部返款明细表
class DivideInfoLine < ActiveRecord::Base
  belongs_to :divide_info
  validates :item_name,:item_type, :presence => true
  validates :item_amt, :numericality => true

  #项目类型
  ITEM_TYPE_IN_FEE = "IN_FEE"
  ITEM_TYPE_OUT_FEE = "OUT_FEE"
  ITEM_TYPE_OTHER_FEE = "OTHER_FEE"

  #默认项目
  DEFAULT_IN_FEE_ITEMS = %w(总货量 提成结算 返程)
  DEFAULT_OUT_FEE_ITEMS = %w(罚款 理赔 扣软件 办公 礼品 短信)
  DEFAULT_OTHER_FEE_ITEMS = %w(补短途 大车费用 补减免  中转)
end
