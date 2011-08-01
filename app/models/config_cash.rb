#coding: utf-8
class ConfigCash < ActiveRecord::Base
  belongs_to :org
  validates_presence_of :fee_from,:fee_to,:hand_fee,:org_id
  #得到默认的手续费设置
  #客户需求中
  #< 1000 1元
  #1000 ~ 2000 2元
  #2000 ~ 3000 3元
  #FIXME 暂不使用
  def self.default_hand_fee(goods_fee)
    q,r = goods_fee.divmod(1000.0)
    if r > 0
      q + 1
    else
      q
    end
  end
  #得到手续费设置比例数组
  def self.hand_fee_a(org_id)
    ret =[]
    self.where(:is_active => true,:org_id => org_id,:is_added_fee => false).order('created_at DESC').each do |config|
      ret += [[(config.fee_from..config.fee_to),config.hand_fee]]
    end
    ret
  end
  #根据设置计算手续费
  def self.cal_hand_fee(org_id,goods_fee)
    found = false
    ret = 0
    hand_fee_a(org_id).each do |fee_rate|
      if fee_rate[0].include? goods_fee
        found = true
        ret = fee_rate[1]
      end
    end
    ret = default_hand_fee(goods_fee) if !found
    ret = 0 if goods_fee == 0
    ret
  end
  def self.cal_added_fee(org_id,goods_fee)
    added_fee_array = []
    self.where(:is_active => true,:org_id => org_id,:is_added_fee => true).order('created_at DESC').each do |config|
      added_fee_array += [[(config.fee_from..config.fee_to),config.added_fee]]
    end
    found = false
    ret = 0
    added_fee_array.each do |added_fee|
      if added_fee[0].include? goods_fee
        found = true
        ret = added_fee[1]
      end
    end
    ret = 0 if !found
    ret = 0 if goods_fee == 0
    ret
  end
end
