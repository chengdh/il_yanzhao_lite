#coding: utf-8
class CreateFeeInfos < ActiveRecord::Migration
  def self.up
    create_table :fee_infos do |t|
      t.date :fee_date
      t.references :org,:null => false
      t.references :user,:null => false
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :fee_infos
  end
end
