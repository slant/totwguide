class CreateMobs < ActiveRecord::Migration
  def self.up
    create_table :mobs do |t|
      t.column :name, :string
      t.column :min_level, :integer
      t.column :max_level, :integer
      t.column :spawntime, :integer
      t.column :more_info, :text
      t.column :info_url, :string
      t.column :forum_url, :string
    end
  end

  def self.down
    drop_table :mobs
  end
end
