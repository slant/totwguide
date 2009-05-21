class Nano < ActiveRecord::Base
  has_many :mobs_nanos
  has_many :mobs, :through => :mobs_nanos
end
