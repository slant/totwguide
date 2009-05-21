class CreateMobsNanos < ActiveRecord::Migration
  def self.up
    create_table :mobs_nanos do |t|
      t.column :mob_id, :integer
      t.column :nano_id, :integer
    end
  end

  def self.down
    drop_table :mobs_nanos
  end
end
