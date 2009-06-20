class CreateTimeplots < ActiveRecord::Migration
  def self.up
    create_table :timeplots do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :timeplots
  end
end
