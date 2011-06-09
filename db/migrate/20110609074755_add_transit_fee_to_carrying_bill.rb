class AddTransitFeeToCarryingBill < ActiveRecord::Migration
  def self.up
    #转货费(给中转部门的费用)
    #FIXME 不同于transit_carrying_fee
    add_column :carrying_bills,:transit_fee,:decimal,:scale => 2,:precision => 15,:default => 0
    #代收运费
    #委托给第三方物流公司代收的运费
    add_column :carrying_bills,:agent_carrying_fee,:decimal,:scale => 2,:precision => 15,:default => 0
    #业务员提成/佣金
    add_column :carrying_bills,:commission,:decimal,:scale => 2,:precision => 15,:default => 0
    #公斤单价
    add_column :carrying_bills,:unit_price_weight,:decimal,:scale => 2,:precision => 15,:default => 0.3
    #送货费
    add_column :carrying_bills,:send_fee,:decimal,:scale => 2,:precision => 15,:default => 0
    #中转信息transit_info 代收运费
    add_column :transit_infos,:agent_carrying_fee,:decimal,:scale => 2,:precision => 15,:default => 0
    #中转提货 transit_deliver_infos 送货费
    add_column :transit_deliver_infos,:send_fee,:decimal,:scale => 2,:precision => 15,:default => 0
    #中转提货 transit_deliver_infos 业务员提成
    add_column :transit_deliver_infos,:commission,:decimal,:scale => 2,:precision => 15,:default => 0

  end

  def self.down
    remove_column :carrying_bills,:transit_fee
    remove_column :carrying_bills,:agent_carrying_fee
    remove_column :carrying_bills,:commission
    remove_column :carrying_bills,:unit_price_weight
    remove_column :carrying_bills,:send_fee
    remove_column :transit_infos,:agent_carrying_fee
    remove_column :transit_deliver_infos,:send_fee
    remove_column :transit_deliver_infos,:commission
  end
end
