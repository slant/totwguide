require File.dirname(__FILE__) + '/../spec_helper'

describe MobsNanosController, "#route_for" do

  it "should map { :controller => 'mobs_nanos', :action => 'index' } to /mobs_nanos" do
    route_for(:controller => "mobs_nanos", :action => "index").should == "/mobs_nanos"
  end
  
  it "should map { :controller => 'mobs_nanos', :action => 'new' } to /mobs_nanos/new" do
    route_for(:controller => "mobs_nanos", :action => "new").should == "/mobs_nanos/new"
  end
  
  it "should map { :controller => 'mobs_nanos', :action => 'show', :id => 1 } to /mobs_nanos/1" do
    route_for(:controller => "mobs_nanos", :action => "show", :id => 1).should == "/mobs_nanos/1"
  end
  
  it "should map { :controller => 'mobs_nanos', :action => 'edit', :id => 1 } to /mobs_nanos/1;edit" do
    route_for(:controller => "mobs_nanos", :action => "edit", :id => 1).should == "/mobs_nanos/1;edit"
  end
  
  it "should map { :controller => 'mobs_nanos', :action => 'update', :id => 1} to /mobs_nanos/1" do
    route_for(:controller => "mobs_nanos", :action => "update", :id => 1).should == "/mobs_nanos/1"
  end
  
  it "should map { :controller => 'mobs_nanos', :action => 'destroy', :id => 1} to /mobs_nanos/1" do
    route_for(:controller => "mobs_nanos", :action => "destroy", :id => 1).should == "/mobs_nanos/1"
  end
  
end

describe MobsNanosController, " handling GET /mobs_nanos" do

  before do
    @mobs_nano = mock_model(MobsNano)
    MobsNano.stub!(:find).and_return([@mobs_nano])
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
  
  it "should find all mobs_nanos" do
    MobsNano.should_receive(:find).with(:all).and_return([@mobs_nano])
    do_get
  end
  
  it "should assign the found mobs_nanos for the view" do
    do_get
    assigns[:mobs_nanos].should == [@mobs_nano]
  end
end

describe MobsNanosController, " handling GET /mobs_nanos.xml" do

  before do
    @mobs_nano = mock_model(MobsNano, :to_xml => "XML")
    MobsNano.stub!(:find).and_return(@mobs_nano)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all mobs_nanos" do
    MobsNano.should_receive(:find).with(:all).and_return([@mobs_nano])
    do_get
  end
  
  it "should render the found mobs_nanos as xml" do
    @mobs_nano.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MobsNanosController, " handling GET /mobs_nanos/1" do

  before do
    @mobs_nano = mock_model(MobsNano)
    MobsNano.stub!(:find).and_return(@mobs_nano)
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
  
  it "should find the mobs_nano requested" do
    MobsNano.should_receive(:find).with("1").and_return(@mobs_nano)
    do_get
  end
  
  it "should assign the found mobs_nano for the view" do
    do_get
    assigns[:mobs_nano].should equal(@mobs_nano)
  end
end

describe MobsNanosController, " handling GET /mobs_nanos/1.xml" do

  before do
    @mobs_nano = mock_model(MobsNano, :to_xml => "XML")
    MobsNano.stub!(:find).and_return(@mobs_nano)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the mobs_nano requested" do
    MobsNano.should_receive(:find).with("1").and_return(@mobs_nano)
    do_get
  end
  
  it "should render the found mobs_nano as xml" do
    @mobs_nano.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MobsNanosController, " handling GET /mobs_nanos/new" do

  before do
    @mobs_nano = mock_model(MobsNano)
    MobsNano.stub!(:new).and_return(@mobs_nano)
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
  
  it "should create an new mobs_nano" do
    MobsNano.should_receive(:new).and_return(@mobs_nano)
    do_get
  end
  
  it "should not save the new mobs_nano" do
    @mobs_nano.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new mobs_nano for the view" do
    do_get
    assigns[:mobs_nano].should equal(@mobs_nano)
  end
end

describe MobsNanosController, " handling GET /mobs_nanos/1;edit" do

  before do
    @mobs_nano = mock_model(MobsNano)
    MobsNano.stub!(:find).and_return(@mobs_nano)
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
  
  it "should find the mobs_nano requested" do
    MobsNano.should_receive(:find).and_return(@mobs_nano)
    do_get
  end
  
  it "should assign the found MobsNano for the view" do
    do_get
    assigns[:mobs_nano].should equal(@mobs_nano)
  end
end

describe MobsNanosController, " handling POST /mobs_nanos" do

  before do
    @mobs_nano = mock_model(MobsNano, :to_param => "1", :save => true)
    MobsNano.stub!(:new).and_return(@mobs_nano)
  end
  
  def do_post
    post :create, :mobs_nano => {:name => 'MobsNano'}
  end
  
  it "should create a new mobs_nano" do
    MobsNano.should_receive(:new).with({'name' => 'MobsNano'}).and_return(@mobs_nano)
    do_post
  end

  it "should redirect to the new mobs_nano" do
    do_post
    response.should redirect_to(mobs_nano_url("1"))
  end
end

describe MobsNanosController, " handling PUT /mobs_nanos/1" do

  before do
    @mobs_nano = mock_model(MobsNano, :to_param => "1", :update_attributes => true)
    MobsNano.stub!(:find).and_return(@mobs_nano)
  end
  
  def do_update
    put :update, :id => "1"
  end
  
  it "should find the mobs_nano requested" do
    MobsNano.should_receive(:find).with("1").and_return(@mobs_nano)
    do_update
  end

  it "should update the found mobs_nano" do
    @mobs_nano.should_receive(:update_attributes)
    do_update
    assigns(:mobs_nano).should equal(@mobs_nano)
  end

  it "should assign the found mobs_nano for the view" do
    do_update
    assigns(:mobs_nano).should equal(@mobs_nano)
  end

  it "should redirect to the mobs_nano" do
    do_update
    response.should redirect_to(mobs_nano_url("1"))
  end
end

describe MobsNanosController, " handling DELETE /mobs_nanos/1" do

  before do
    @mobs_nano = mock_model(MobsNano, :destroy => true)
    MobsNano.stub!(:find).and_return(@mobs_nano)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the mobs_nano requested" do
    MobsNano.should_receive(:find).with("1").and_return(@mobs_nano)
    do_delete
  end
  
  it "should call destroy on the found mobs_nano" do
    @mobs_nano.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the mobs_nanos list" do
    do_delete
    response.should redirect_to(mobs_nanos_url)
  end
end