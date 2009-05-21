require File.dirname(__FILE__) + '/../spec_helper'

describe TempleController do

  #Delete these examples and add some real ones
  it "should use TempleController" do
    controller.should be_an_instance_of(TempleController)
  end


  it "GET 'index' should be successful" do
    get 'index'
    response.should be_success
  end
end
