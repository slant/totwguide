require File.dirname(__FILE__) + '/../../spec_helper'

describe "/mobs_nanos/edit.rhtml" do
  include MobsNanosHelper
  
  before do
    @errors = stub("errors", :count => 0)
    @mobs_nano = mock_model(MobsNano, :errors => @errors)
    @mobs_nano.stub!(:mob_id).and_return("1")
    @mobs_nano.stub!(:nano_id).and_return("1")
    assigns[:mobs_nano] = @mobs_nano
  end

  it "should render edit form" do
    render "/mobs_nanos/edit.rhtml"
    
    response.should have_tag("form[action=#{mobs_nano_path(@mobs_nano)}][method=post]") do
    end
  end
end


