require File.dirname(__FILE__) + '/../../spec_helper'

describe "/posts/show.rhtml" do
  include PostsHelper
  
  before do
    @post = mock("Post")
    @post.stub!(:title).and_return("MyString")
    @post.stub!(:body).and_return("MyText")
    @post.stub!(:user_id).and_return("1")
    @post.stub!(:created_at).and_return(Time.now)
    @post.stub!(:modified_at).and_return(Time.now)

    assigns[:post] = @post
  end

  it "should render attributes in <p>" do
    render "/posts/show.rhtml"

    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

