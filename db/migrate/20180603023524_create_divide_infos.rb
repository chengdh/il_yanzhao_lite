#coding: utf-8
#分部分成明细表
class CreateDivideInfos < ActiveRecord::Migration
  def self.up
    create_table :divide_infos do |t|
      t.references :org,:null => false
      t.date :bill_date,:null => false
      t.string :bill_mth,:null => false
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :divide_infos
  end
end
