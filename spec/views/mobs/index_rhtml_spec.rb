require File.dirname(__FILE__) + '/../../spec_helper'

describe "/mobs/index.rhtml" do
  include MobsHelper
  
  before do
    mob_98 = mock_model(Mob)
    mob_98.should_receive(:name).and_return("MyString")
    mob_98.should_receive(:min_level).and_return("1")
    mob_98.should_receive(:max_level).and_return("1")
    mob_98.should_receive(:spawntime).and_return("1")
    mob_98.should_receive(:more_info).and_return("MyText")
    mob_98.should_receive(:info_url).and_return("MyString")
    mob_98.should_receive(:forum_url).and_return("MyString")

    mob_99 = mock_model(Mob)
    mob_99.should_receive(:name).and_return("MyString")
    mob_99.should_receive(:min_level).and_return("1")
    mob_99.should_receive(:max_level).and_return("1")
    mob_99.should_receive(:spawntime).and_return("1")
    mob_99.should_receive(:more_info).and_return("MyText")
    mob_99.should_receive(:info_url).and_return("MyString")
    mob_99.should_receive(:forum_url).and_return("MyString")

    assigns[:mobs] = [mob_98, mob_99]
  end

  it "should render list of mobs" do
    render "/mobs/index.rhtml"

    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

