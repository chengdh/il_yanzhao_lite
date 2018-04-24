#coding: utf-8
#流水账明细
class CreateFeeInfoLines < ActiveRecord::Migration
  def self.up
    create_table :fee_info_lines do |t|
      t.references :fee_info
      t.integer :fee_type,:default => 9
      t.string :fee_note,:null => false,:limit => 60
      t.decimal :fee,:precision => 15,:scale => 2,:default => 0
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :fee_info_lines
  end
end
