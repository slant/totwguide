require File.dirname(__FILE__) + '/../../spec_helper'

describe "/items/new.rhtml" do
  include ItemsHelper
  
  before do
    @errors = stub("errors", :count => 0)
    @item = mock_model(Item, :errors => @errors)
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

  it "should render new form" do
    render "/items/new.rhtml"
    
    response.should have_tag("form[action=?][method=post]", items_path) do
      with_tag("input#item_name[name=?]", "item[name]")
      with_tag("input#item_item_ref[name=?]", "item[item_ref]")
      with_tag("input#item_image[name=?]", "item[image]")
      with_tag("input#item_profession[name=?]", "item[profession]")
      with_tag("input#item_category[name=?]", "item[category]")
      with_tag("input#item_rarity[name=?]", "item[rarity]")
      with_tag("input#item_droprate[name=?]", "item[droprate]")
      with_tag("textarea#item_more_info[name=?]", "item[more_info]")
      with_tag("input#item_info_url[name=?]", "item[info_url]")
      with_tag("input#item_forum_url[name=?]", "item[forum_url]")
    end
  end
end


