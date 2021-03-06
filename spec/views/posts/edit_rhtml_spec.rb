require File.dirname(__FILE__) + '/../../spec_helper'

describe "/posts/edit.rhtml" do
  include PostsHelper
  
  before do
    @errors = stub("errors", :count => 0)
    @post = mock_model(Post, :errors => @errors)
    @post.stub!(:title).and_return("MyString")
    @post.stub!(:body).and_return("MyText")
    @post.stub!(:user_id).and_return("1")
    @post.stub!(:created_at).and_return(Time.now)
    @post.stub!(:modified_at).and_return(Time.now)
    assigns[:post] = @post
  end

  it "should render edit form" do
    render "/posts/edit.rhtml"
    
    response.should have_tag("form[action=#{post_path(@post)}][method=post]") do
      with_tag('input#post_title[name=?]', "post[title]")
      with_tag('textarea#post_body[name=?]', "post[body]")
    end
  end
end


