require File.dirname(__FILE__) + '/../../spec_helper'

describe "/nanos/new.rhtml" do
  include NanosHelper
  
  before do
    @errors = stub("errors", :count => 0)
    @nano = mock_model(Nano, :errors => @errors)
    @nano.stub!(:name).and_return("MyString")
    @nano.stub!(:url).and_return("MyString")
    assigns[:nano] = @nano
  end

  it "should render new form" do
    render "/nanos/new.rhtml"
    
    response.should have_tag("form[action=?][method=post]", nanos_path) do
      with_tag("input#nano_name[name=?]", "nano[name]")
      with_tag("input#nano_url[name=?]", "nano[url]")
    end
  end
end


