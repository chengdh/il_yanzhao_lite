class CreateMthSettlementLines < ActiveRecord::Migration
  def self.up
    create_table :mth_settlement_lines do |t|
      t.references :mth_settlement
      t.references :org,:null => false
      t.decimal :from_carrying_fee,:presicison => 15,:scale => 2,:default => 0
      t.decimal :to_carrying_fee,:presicison => 15,:scale => 2,:default => 0
      t.decimal :insured_fee,:presicison => 15,:scale => 2,:default => 0
      t.decimal :commission_fee,:presicison => 15,:scale => 2,:default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :mth_settlement_lines
  end
end
