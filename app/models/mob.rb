class Mob < ActiveRecord::Base
  has_many :items_mobs
  has_many :items, :through => :items_mobs
  has_many :mobs_nanos
  has_many :nanos, :through => :mobs_nanos
end
