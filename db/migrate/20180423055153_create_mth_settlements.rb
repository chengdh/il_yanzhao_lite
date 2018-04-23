#coding: utf-8
#月运费结算单
class CreateMthSettlements < ActiveRecord::Migration
  def self.up
    create_table :mth_settlements do |t|
      t.string :mth,:limit => 6
      # t.decimal :to_carrying_fee,:precision => 15,:scale => 2,:default => 0
      # t.decimal :from_carrying_fee,:precision => 15,:scale => 2,:default => 0
      # t.decimal :insured_fee,:precision => 15,:scale => 2,:default => 0
      # t.decimal :commission_fee,:precision => 15,:scale => 2,:default => 0
      # t.references :org,:null => false
      t.references :user
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :mth_settlements
  end
end
