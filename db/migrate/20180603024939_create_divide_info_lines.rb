#coding: utf-8
class CreateDivideInfoLines < ActiveRecord::Migration
  def self.up
    create_table :divide_info_lines do |t|
      t.string :item_name,:limit => 30,:null => false
      t.decimal :item_amt,:precision => 15,:scale => 2,:default => 0
      t.string :item_type,:limit => 10,:null => false,:default => "IN_FEE"
      t.text :item_note
      t.references :divide_info

      t.timestamps
    end
  end

  def self.down
    drop_table :divide_info_lines
  end
end
