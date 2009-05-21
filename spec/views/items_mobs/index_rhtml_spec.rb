require File.dirname(__FILE__) + '/../../spec_helper'

describe "/items_mobs/index.rhtml" do
  include ItemsMobsHelper
  
  before do
    items_mob_98 = mock_model(ItemsMob)
    items_mob_98.should_receive(:item_id).and_return("1")
    items_mob_98.should_receive(:mob_id).and_return("1")

    items_mob_99 = mock_model(ItemsMob)
    items_mob_99.should_receive(:item_id).and_return("1")
    items_mob_99.should_receive(:mob_id).and_return("1")

    assigns[:items_mobs] = [items_mob_98, items_mob_99]
  end

  it "should render list of items_mobs" do
    render "/items_mobs/index.rhtml"

  end
end

