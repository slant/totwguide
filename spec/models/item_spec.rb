require File.dirname(__FILE__) + '/../spec_helper'

describe Item do
  before(:each) do
    @items = Item.new
  end

  it "should be valid" do
     @items.should be_valid
  end
end
