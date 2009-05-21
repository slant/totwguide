require File.dirname(__FILE__) + '/../../spec_helper'

describe "/nanos/edit.rhtml" do
  include NanosHelper
  
  before do
    @errors = stub("errors", :count => 0)
    @nano = mock_model(Nano, :errors => @errors)
    @nano.stub!(:name).and_return("MyString")
    @nano.stub!(:url).and_return("MyString")
    assigns[:nano] = @nano
  end

  it "should render edit form" do
    render "/nanos/edit.rhtml"
    
    response.should have_tag("form[action=#{nano_path(@nano)}][method=post]") do
      with_tag('input#nano_name[name=?]', "nano[name]")
      with_tag('input#nano_url[name=?]', "nano[url]")
    end
  end
end


