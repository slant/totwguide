require File.dirname(__FILE__) + '/../../spec_helper'

describe "/items_mobs/edit.rhtml" do
  include ItemsMobsHelper
  
  before do
    @errors = stub("errors", :count => 0)
    @items_mob = mock_model(ItemsMob, :errors => @errors)
    @items_mob.stub!(:item_id).and_return("1")
    @items_mob.stub!(:mob_id).and_return("1")
    assigns[:items_mob] = @items_mob
  end

  it "should render edit form" do
    render "/items_mobs/edit.rhtml"
    
    response.should have_tag("form[action=#{items_mob_path(@items_mob)}][method=post]") do
    end
  end
end


