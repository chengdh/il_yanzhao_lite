class AddTransitBillNoToCarryingBill < ActiveRecord::Migration
  def self.up
    add_column :carrying_bills,:transit_bill_no,:string,:limit => 20
  end

  def self.down
    remove_column :carrying_bills,:transit_bill_no
  end
end
