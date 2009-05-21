class ItemsMob < ActiveRecord::Base
  belongs_to :item
  belongs_to :mob
end
