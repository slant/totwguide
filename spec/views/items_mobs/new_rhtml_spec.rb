require File.dirname(__FILE__) + '/../../spec_helper'

describe "/items_mobs/new.rhtml" do
  include ItemsMobsHelper
  
  before do
    @errors = stub("errors", :count => 0)
    @items_mob = mock_model(ItemsMob, :errors => @errors)
    @items_mob.stub!(:item_id).and_return("1")
    @items_mob.stub!(:mob_id).and_return("1")
    assigns[:items_mob] = @items_mob
  end

  it "should render new form" do
    render "/items_mobs/new.rhtml"
    
    response.should have_tag("form[action=?][method=post]", items_mobs_path) do
    end
  end
end


