class AddSendFeeToDeliverInfo < ActiveRecord::Migration
  def self.up
    add_column :deliver_infos,:send_fee,:decimal,:scale => 2,:precision => 15,:default => 0
    add_column :deliver_infos,:commission,:decimal,:scale => 2,:precision => 15,:default => 0
  end

  def self.down
    remove_column :deliver_infos,:send_fee
    remove_column :deliver_infos,:commission
  end
end
