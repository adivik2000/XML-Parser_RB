class CreateEnrolments < ActiveRecord::Migration
  def self.up
    create_table :enrolments do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :enrolments
  end
end
