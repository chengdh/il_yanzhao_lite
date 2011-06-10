class AddOrgIdToConfigCash < ActiveRecord::Migration
  def self.up
    add_column :config_cashes,:org_id,:integer
  end

  def self.down
    remove_column :config_cashes,:org_id
  end
end
