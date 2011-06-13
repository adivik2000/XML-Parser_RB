class CreateDivisionsGroups < ActiveRecord::Migration
  def self.up
    create_table :divisions_groups do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :divisions_groups
  end
end
