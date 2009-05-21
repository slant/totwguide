require File.dirname(__FILE__) + '/../../spec_helper'

describe "/mobs/show.rhtml" do
  include MobsHelper
  
  before do
    @mob = mock("Mob")
    @mob.stub!(:name).and_return("MyString")
    @mob.stub!(:min_level).and_return("1")
    @mob.stub!(:max_level).and_return("1")
    @mob.stub!(:spawntime).and_return("1")
    @mob.stub!(:more_info).and_return("MyText")
    @mob.stub!(:info_url).and_return("MyString")
    @mob.stub!(:forum_url).and_return("MyString")

    assigns[:mob] = @mob
  end

  it "should render attributes in <p>" do
    render "/mobs/show.rhtml"

    response.should have_text(/MyString/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

