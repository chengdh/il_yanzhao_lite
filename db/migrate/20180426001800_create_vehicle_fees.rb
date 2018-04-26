#coding: utf-8
class CreateVehicleFees < ActiveRecord::Migration
  def self.up
    create_table :vehicle_fees do |t|
      t.references :org,:null => false
      t.string :name,:limit => 60
      t.date :fee_date
      t.references :user,:null => false
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicle_fees
  end
end
