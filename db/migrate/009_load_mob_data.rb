require 'active_record/fixtures'

class LoadMobData < ActiveRecord::Migration
  def self.up
    down
    directory = File.join(File.dirname(__FILE__), "dev_data")
    Fixtures.create_fixtures(directory, "mobs")
  end

  def self.down
    Mob.delete_all
  end
end
