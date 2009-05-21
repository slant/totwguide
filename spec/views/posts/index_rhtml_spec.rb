require File.dirname(__FILE__) + '/../../spec_helper'

describe "/posts/index.rhtml" do
  include PostsHelper
  
  before do
    post_98 = mock_model(Post)
    post_98.should_receive(:title).and_return("MyString")
    post_98.should_receive(:body).and_return("MyText")
    post_98.should_receive(:user_id).and_return("1")
    post_98.should_receive(:created_at).and_return(Time.now)
    post_98.should_receive(:modified_at).and_return(Time.now)

    post_99 = mock_model(Post)
    post_99.should_receive(:title).and_return("MyString")
    post_99.should_receive(:body).and_return("MyText")
    post_99.should_receive(:user_id).and_return("1")
    post_99.should_receive(:created_at).and_return(Time.now)
    post_99.should_receive(:modified_at).and_return(Time.now)

    assigns[:posts] = [post_98, post_99]
  end

  it "should render list of posts" do
    render "/posts/index.rhtml"

    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

