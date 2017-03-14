#coding: utf-8
class AddAddedFeeToConfigCash < ActiveRecord::Migration
  def self.up
    #附加费用,例如:磁县每张票加6元
    add_column :config_cashes, :added_fee, :decimal,:default => 0,:precision => 10,:scale => 2
    add_column :config_cashes, :is_added_fee, :boolean,:default => false

  end

  def self.down
    remove_column :config_cashes, :added_fee
    remove_column :config_cashes, :is_added_fee
  end
end
