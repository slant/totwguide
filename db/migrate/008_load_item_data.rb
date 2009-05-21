require 'active_record/fixtures'

class LoadItemData < ActiveRecord::Migration
  def self.up
    down
    directory = File.join(File.dirname(__FILE__), "dev_data")
    Fixtures.create_fixtures(directory, "items")
  end

  def self.down
    Item.delete_all
  end
end
