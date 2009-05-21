require File.dirname(__FILE__) + '/../spec_helper'

describe ItemsMob do
  before(:each) do
    @items_mobs = ItemsMob.new
  end

  it "should be valid" do
     @items_mobs.should be_valid
  end
end
