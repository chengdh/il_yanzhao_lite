#coding: utf-8
class AddUnitCarryingFeePriceToCarryingBill < ActiveRecord::Migration
  def self.up
    add_column :carrying_bills, :unit_carrying_fee_price, :decimal,:precision => 15,:scale => 2,:default => 0
  end

  def self.down
    remove_column :carrying_bills, :unit_carrying_fee_price
  end
end
