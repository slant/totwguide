require File.dirname(__FILE__) + '/../../spec_helper'

describe "/items/index.rhtml" do
  include ItemsHelper
  
  before do
    item_98 = mock_model(Item)
    item_98.should_receive(:name).and_return("MyString")
    item_98.should_receive(:item_ref).and_return("1")
    item_98.should_receive(:image).and_return("MyString")
    item_98.should_receive(:profession).and_return("MyString")
    item_98.should_receive(:category).and_return("MyString")
    item_98.should_receive(:rarity).and_return("1")
    item_98.should_receive(:droprate).and_return("1")
    item_98.should_receive(:more_info).and_return("MyText")
    item_98.should_receive(:info_url).and_return("MyString")
    item_98.should_receive(:forum_url).and_return("MyString")

    item_99 = mock_model(Item)
    item_99.should_receive(:name).and_return("MyString")
    item_99.should_receive(:item_ref).and_return("1")
    item_99.should_receive(:image).and_return("MyString")
    item_99.should_receive(:profession).and_return("MyString")
    item_99.should_receive(:category).and_return("MyString")
    item_99.should_receive(:rarity).and_return("1")
    item_99.should_receive(:droprate).and_return("1")
    item_99.should_receive(:more_info).and_return("MyText")
    item_99.should_receive(:info_url).and_return("MyString")
    item_99.should_receive(:forum_url).and_return("MyString")

    assigns[:items] = [item_98, item_99]
  end

  it "should render list of items" do
    render "/items/index.rhtml"

    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

