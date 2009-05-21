require File.dirname(__FILE__) + '/../spec_helper'

describe Mob do
  before(:each) do
    @mobs = Mob.new
  end

  it "should be valid" do
     @mobs.should be_valid
  end
end
