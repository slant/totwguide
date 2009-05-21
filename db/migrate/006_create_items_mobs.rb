class CreateItemsMobs < ActiveRecord::Migration
  def self.up
    create_table :items_mobs do |t|
      t.column :item_id, :integer
      t.column :mob_id, :integer
    end
  end

  def self.down
    drop_table :items_mobs
  end
end
