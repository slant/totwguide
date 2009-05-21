class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.column :name, :string
      t.column :item_ref, :integer
      t.column :image, :string
      t.column :profession, :string
      t.column :category, :string
      t.column :rarity, :integer
      t.column :droprate, :integer
      t.column :more_info, :text
      t.column :info_url, :string
      t.column :forum_url, :string
    end
    add_index :items, :item_ref
  end

  def self.down
    drop_table :items
  end
end
