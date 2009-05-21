require File.dirname(__FILE__) + '/../../spec_helper'

describe "/mobs_nanos/show.rhtml" do
  include MobsNanosHelper
  
  before do
    @mobs_nano = mock("MobsNano")
    @mobs_nano.stub!(:mob_id).and_return("1")
    @mobs_nano.stub!(:nano_id).and_return("1")

    assigns[:mobs_nano] = @mobs_nano
  end

  it "should render attributes in <p>" do
    render "/mobs_nanos/show.rhtml"

  end
end

