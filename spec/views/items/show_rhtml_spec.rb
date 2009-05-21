require File.dirname(__FILE__) + '/../../spec_helper'

describe "/items/show.rhtml" do
  include ItemsHelper
  
  before do
    @item = mock("Item")
    @item.stub!(:name).and_return("MyString")
    @item.stub!(:item_ref).and_return("1")
    @item.stub!(:image).and_return("MyString")
    @item.stub!(:profession).and_return("MyString")
    @item.stub!(:category).and_return("MyString")
    @item.stub!(:rarity).and_return("1")
    @item.stub!(:droprate).and_return("1")
    @item.stub!(:more_info).and_return("MyText")
    @item.stub!(:info_url).and_return("MyString")
    @item.stub!(:forum_url).and_return("MyString")

    assigns[:item] = @item
  end

  it "should render attributes in <p>" do
    render "/items/show.rhtml"

    response.should have_text(/MyString/)
    response.should have_text(/1/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

