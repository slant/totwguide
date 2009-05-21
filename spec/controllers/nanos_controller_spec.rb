require File.dirname(__FILE__) + '/../spec_helper'

describe NanosController, "#route_for" do

  it "should map { :controller => 'nanos', :action => 'index' } to /nanos" do
    route_for(:controller => "nanos", :action => "index").should == "/nanos"
  end
  
  it "should map { :controller => 'nanos', :action => 'new' } to /nanos/new" do
    route_for(:controller => "nanos", :action => "new").should == "/nanos/new"
  end
  
  it "should map { :controller => 'nanos', :action => 'show', :id => 1 } to /nanos/1" do
    route_for(:controller => "nanos", :action => "show", :id => 1).should == "/nanos/1"
  end
  
  it "should map { :controller => 'nanos', :action => 'edit', :id => 1 } to /nanos/1;edit" do
    route_for(:controller => "nanos", :action => "edit", :id => 1).should == "/nanos/1;edit"
  end
  
  it "should map { :controller => 'nanos', :action => 'update', :id => 1} to /nanos/1" do
    route_for(:controller => "nanos", :action => "update", :id => 1).should == "/nanos/1"
  end
  
  it "should map { :controller => 'nanos', :action => 'destroy', :id => 1} to /nanos/1" do
    route_for(:controller => "nanos", :action => "destroy", :id => 1).should == "/nanos/1"
  end
  
end

describe NanosController, " handling GET /nanos" do

  before do
    @nano = mock_model(Nano)
    Nano.stub!(:find).and_return([@nano])
  end
  
  def do_get
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should render index template" do
    do_get
    response.should render_template('index')
  end
  
  it "should find all nanos" do
    Nano.should_receive(:find).with(:all).and_return([@nano])
    do_get
  end
  
  it "should assign the found nanos for the view" do
    do_get
    assigns[:nanos].should == [@nano]
  end
end

describe NanosController, " handling GET /nanos.xml" do

  before do
    @nano = mock_model(Nano, :to_xml => "XML")
    Nano.stub!(:find).and_return(@nano)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all nanos" do
    Nano.should_receive(:find).with(:all).and_return([@nano])
    do_get
  end
  
  it "should render the found nanos as xml" do
    @nano.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe NanosController, " handling GET /nanos/1" do

  before do
    @nano = mock_model(Nano)
    Nano.stub!(:find).and_return(@nano)
  end
  
  def do_get
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render show template" do
    do_get
    response.should render_template('show')
  end
  
  it "should find the nano requested" do
    Nano.should_receive(:find).with("1").and_return(@nano)
    do_get
  end
  
  it "should assign the found nano for the view" do
    do_get
    assigns[:nano].should equal(@nano)
  end
end

describe NanosController, " handling GET /nanos/1.xml" do

  before do
    @nano = mock_model(Nano, :to_xml => "XML")
    Nano.stub!(:find).and_return(@nano)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the nano requested" do
    Nano.should_receive(:find).with("1").and_return(@nano)
    do_get
  end
  
  it "should render the found nano as xml" do
    @nano.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe NanosController, " handling GET /nanos/new" do

  before do
    @nano = mock_model(Nano)
    Nano.stub!(:new).and_return(@nano)
  end
  
  def do_get
    get :new
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render new template" do
    do_get
    response.should render_template('new')
  end
  
  it "should create an new nano" do
    Nano.should_receive(:new).and_return(@nano)
    do_get
  end
  
  it "should not save the new nano" do
    @nano.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new nano for the view" do
    do_get
    assigns[:nano].should equal(@nano)
  end
end

describe NanosController, " handling GET /nanos/1;edit" do

  before do
    @nano = mock_model(Nano)
    Nano.stub!(:find).and_return(@nano)
  end
  
  def do_get
    get :edit, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render edit template" do
    do_get
    response.should render_template('edit')
  end
  
  it "should find the nano requested" do
    Nano.should_receive(:find).and_return(@nano)
    do_get
  end
  
  it "should assign the found Nano for the view" do
    do_get
    assigns[:nano].should equal(@nano)
  end
end

describe NanosController, " handling POST /nanos" do

  before do
    @nano = mock_model(Nano, :to_param => "1", :save => true)
    Nano.stub!(:new).and_return(@nano)
  end
  
  def do_post
    post :create, :nano => {:name => 'Nano'}
  end
  
  it "should create a new nano" do
    Nano.should_receive(:new).with({'name' => 'Nano'}).and_return(@nano)
    do_post
  end

  it "should redirect to the new nano" do
    do_post
    response.should redirect_to(nano_url("1"))
  end
end

describe NanosController, " handling PUT /nanos/1" do

  before do
    @nano = mock_model(Nano, :to_param => "1", :update_attributes => true)
    Nano.stub!(:find).and_return(@nano)
  end
  
  def do_update
    put :update, :id => "1"
  end
  
  it "should find the nano requested" do
    Nano.should_receive(:find).with("1").and_return(@nano)
    do_update
  end

  it "should update the found nano" do
    @nano.should_receive(:update_attributes)
    do_update
    assigns(:nano).should equal(@nano)
  end

  it "should assign the found nano for the view" do
    do_update
    assigns(:nano).should equal(@nano)
  end

  it "should redirect to the nano" do
    do_update
    response.should redirect_to(nano_url("1"))
  end
end

describe NanosController, " handling DELETE /nanos/1" do

  before do
    @nano = mock_model(Nano, :destroy => true)
    Nano.stub!(:find).and_return(@nano)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the nano requested" do
    Nano.should_receive(:find).with("1").and_return(@nano)
    do_delete
  end
  
  it "should call destroy on the found nano" do
    @nano.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the nanos list" do
    do_delete
    response.should redirect_to(nanos_url)
  end
end