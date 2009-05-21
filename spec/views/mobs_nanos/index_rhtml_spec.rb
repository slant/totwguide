require File.dirname(__FILE__) + '/../../spec_helper'

describe "/mobs_nanos/index.rhtml" do
  include MobsNanosHelper
  
  before do
    mobs_nano_98 = mock_model(MobsNano)
    mobs_nano_98.should_receive(:mob_id).and_return("1")
    mobs_nano_98.should_receive(:nano_id).and_return("1")

    mobs_nano_99 = mock_model(MobsNano)
    mobs_nano_99.should_receive(:mob_id).and_return("1")
    mobs_nano_99.should_receive(:nano_id).and_return("1")

    assigns[:mobs_nanos] = [mobs_nano_98, mobs_nano_99]
  end

  it "should render list of mobs_nanos" do
    render "/mobs_nanos/index.rhtml"

  end
end

