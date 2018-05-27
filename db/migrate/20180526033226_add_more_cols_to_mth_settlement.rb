
#coding: utf-8
#向表中添加其他字段
class AddMoreColsToMthSettlement < ActiveRecord::Migration
  def self.up
    #经营费用
    add_column :mth_settlement_lines,:cost_fee,:decimal,:precision => 15,:scale => 2,:default => 0
    #大车费用
    add_column :mth_settlement_lines,:vehicle_fee,:decimal,:precision => 15,:scale => 2,:default => 0
    #装卸费用
    add_column :mth_settlement_lines,:load_fee,:decimal,:precision => 15,:scale => 2,:default => 0
  end

  def self.down
    remove_column :mth_settlement_lines,:cost_fee
    remove_column :mth_settlement_lines,:vehicle_fee
    remove_column :mth_settlement_lines,:load_fee
  end
end
