require File.dirname(__FILE__) + '/../../spec_helper'

describe "/nanos/show.rhtml" do
  include NanosHelper
  
  before do
    @nano = mock("Nano")
    @nano.stub!(:name).and_return("MyString")
    @nano.stub!(:url).and_return("MyString")

    assigns[:nano] = @nano
  end

  it "should render attributes in <p>" do
    render "/nanos/show.rhtml"

    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

