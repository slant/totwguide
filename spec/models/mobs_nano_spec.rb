require File.dirname(__FILE__) + '/../spec_helper'

describe MobsNano do
  before(:each) do
    @mobs_nanos = MobsNano.new
  end

  it "should be valid" do
     @mobs_nanos.should be_valid
  end
end
