#coding: utf-8
class AddUserId2DivideInfo < ActiveRecord::Migration
  def self.up
    add_column :divide_infos,:user_id,:integer
  end

  def self.down
    remove_column :divide_infos,:user_id
  end
end
