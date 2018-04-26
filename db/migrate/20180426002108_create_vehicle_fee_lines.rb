#coding: utf-8
class CreateVehicleFeeLines < ActiveRecord::Migration
  def self.up
    create_table :vehicle_fee_lines do |t|
      t.references :vehicle_fee
      t.string :v_no,:limit => 20,:null => false
      t.references :to_org
      t.decimal :load_fee,:precision => 15,:scale => 2,:default => 0
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicle_fee_lines
  end
end
