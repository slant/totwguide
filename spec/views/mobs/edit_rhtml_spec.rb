require File.dirname(__FILE__) + '/../../spec_helper'

describe "/mobs/edit.rhtml" do
  include MobsHelper
  
  before do
    @errors = stub("errors", :count => 0)
    @mob = mock_model(Mob, :errors => @errors)
    @mob.stub!(:name).and_return("MyString")
    @mob.stub!(:min_level).and_return("1")
    @mob.stub!(:max_level).and_return("1")
    @mob.stub!(:spawntime).and_return("1")
    @mob.stub!(:more_info).and_return("MyText")
    @mob.stub!(:info_url).and_return("MyString")
    @mob.stub!(:forum_url).and_return("MyString")
    assigns[:mob] = @mob
  end

  it "should render edit form" do
    render "/mobs/edit.rhtml"
    
    response.should have_tag("form[action=#{mob_path(@mob)}][method=post]") do
      with_tag('input#mob_name[name=?]', "mob[name]")
      with_tag('input#mob_min_level[name=?]', "mob[min_level]")
      with_tag('input#mob_max_level[name=?]', "mob[max_level]")
      with_tag('input#mob_spawntime[name=?]', "mob[spawntime]")
      with_tag('textarea#mob_more_info[name=?]', "mob[more_info]")
      with_tag('input#mob_info_url[name=?]', "mob[info_url]")
      with_tag('input#mob_forum_url[name=?]', "mob[forum_url]")
    end
  end
end


