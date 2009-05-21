require File.dirname(__FILE__) + '/../../spec_helper'

describe "/nanos/index.rhtml" do
  include NanosHelper
  
  before do
    nano_98 = mock_model(Nano)
    nano_98.should_receive(:name).and_return("MyString")
    nano_98.should_receive(:url).and_return("MyString")

    nano_99 = mock_model(Nano)
    nano_99.should_receive(:name).and_return("MyString")
    nano_99.should_receive(:url).and_return("MyString")

    assigns[:nanos] = [nano_98, nano_99]
  end

  it "should render list of nanos" do
    render "/nanos/index.rhtml"

    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

