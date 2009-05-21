require File.dirname(__FILE__) + '/../../spec_helper'

describe "/items_mobs/show.rhtml" do
  include ItemsMobsHelper
  
  before do
    @items_mob = mock("ItemsMob")
    @items_mob.stub!(:item_id).and_return("1")
    @items_mob.stub!(:mob_id).and_return("1")

    assigns[:items_mob] = @items_mob
  end

  it "should render attributes in <p>" do
    render "/items_mobs/show.rhtml"

  end
end

