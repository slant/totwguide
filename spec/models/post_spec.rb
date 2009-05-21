require File.dirname(__FILE__) + '/../spec_helper'

describe Post do
  before(:each) do
    @posts = Post.new
  end

  it "should be valid" do
     @posts.should be_valid
  end
end
