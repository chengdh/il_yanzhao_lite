#coding: utf-8
class GexceptionAuthorizeInfo < ActiveRecord::Base
  belongs_to :user
  belongs_to :goods_exception

  default_value_for :bill_date,Date.today

  #赔偿方式
  COMPENSATE_TYPE_NOPAY = 'NP'
  COMPENSATE_TYPE_FROM_ORG = 'FO'
  COMPENSATE_TYPE_TO_ORG = 'TO'
  COMPENSATE_TYPE_HEADQUARTERS = 'HP'
  #赔偿方式描述
  def self.op_types
    {
      "免赔" => COMPENSATE_TYPE_NOPAY, 
      "发货站处理" => COMPENSATE_TYPE_FROM_ORG,
      "到货站处理" => COMPENSATE_TYPE_FROM_ORG,
      "总部处理" => COMPENSATE_TYPE_HEADQUARTERS
    }
  end

end
