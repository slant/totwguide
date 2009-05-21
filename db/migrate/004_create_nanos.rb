class CreateNanos < ActiveRecord::Migration
  def self.up
    create_table :nanos do |t|
      t.column :name, :string
      t.column :url, :string
    end
  end

  def self.down
    drop_table :nanos
  end
end
