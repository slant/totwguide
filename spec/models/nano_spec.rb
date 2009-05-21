require File.dirname(__FILE__) + '/../spec_helper'

describe Nano do
  before(:each) do
    @nanos = Nano.new
  end

  it "should be valid" do
     @nanos.should be_valid
  end
end
