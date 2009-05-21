class Item < ActiveRecord::Base
  has_many :items_mobs
  has_many :mobs, :through => :items_mobs
end
