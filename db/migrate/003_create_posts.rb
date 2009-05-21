class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.column :title, :string
      t.column :body, :text
      t.column :account_id, :integer
      t.column :created_at, :datetime
      t.column :modified_at, :datetime
    end
    add_index :posts, :created_at
  end

  def self.down
    drop_table :posts
  end
end
