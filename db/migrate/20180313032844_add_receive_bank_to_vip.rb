#coding: utf-8
class AddReceiveBankToVip < ActiveRecord::Migration
  def self.up
    add_column :customers,:receive_bank,:string,:limit => 60
    add_column :customers,:receive_address,:string,:limit => 60
  end

  def self.down
    remove_column :customers,:receive_bank
    remove_column :customers,:receive_address
  end
end
