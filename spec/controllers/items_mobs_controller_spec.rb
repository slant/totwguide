require File.dirname(__FILE__) + '/../spec_helper'

describe ItemsMobsController, "#route_for" do

  it "should map { :controller => 'items_mobs', :action => 'index' } to /items_mobs" do
    route_for(:controller => "items_mobs", :action => "index").should == "/items_mobs"
  end
  
  it "should map { :controller => 'items_mobs', :action => 'new' } to /items_mobs/new" do
    route_for(:controller => "items_mobs", :action => "new").should == "/items_mobs/new"
  end
  
  it "should map { :controller => 'items_mobs', :action => 'show', :id => 1 } to /items_mobs/1" do
    route_for(:controller => "items_mobs", :action => "show", :id => 1).should == "/items_mobs/1"
  end
  
  it "should map { :controller => 'items_mobs', :action => 'edit', :id => 1 } to /items_mobs/1;edit" do
    route_for(:controller => "items_mobs", :action => "edit", :id => 1).should == "/items_mobs/1;edit"
  end
  
  it "should map { :controller => 'items_mobs', :action => 'update', :id => 1} to /items_mobs/1" do
    route_for(:controller => "items_mobs", :action => "update", :id => 1).should == "/items_mobs/1"
  end
  
  it "should map { :controller => 'items_mobs', :action => 'destroy', :id => 1} to /items_mobs/1" do
    route_for(:controller => "items_mobs", :action => "destroy", :id => 1).should == "/items_mobs/1"
  end
  
end

describe ItemsMobsController, " handling GET /items_mobs" do

  before do
    @items_mob = mock_model(ItemsMob)
    ItemsMob.stub!(:find).and_return([@items_mob])
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
  
  it "should find all items_mobs" do
    ItemsMob.should_receive(:find).with(:all).and_return([@items_mob])
    do_get
  end
  
  it "should assign the found items_mobs for the view" do
    do_get
    assigns[:items_mobs].should == [@items_mob]
  end
end

describe ItemsMobsController, " handling GET /items_mobs.xml" do

  before do
    @items_mob = mock_model(ItemsMob, :to_xml => "XML")
    ItemsMob.stub!(:find).and_return(@items_mob)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all items_mobs" do
    ItemsMob.should_receive(:find).with(:all).and_return([@items_mob])
    do_get
  end
  
  it "should render the found items_mobs as xml" do
    @items_mob.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe ItemsMobsController, " handling GET /items_mobs/1" do

  before do
    @items_mob = mock_model(ItemsMob)
    ItemsMob.stub!(:find).and_return(@items_mob)
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
  
  it "should find the items_mob requested" do
    ItemsMob.should_receive(:find).with("1").and_return(@items_mob)
    do_get
  end
  
  it "should assign the found items_mob for the view" do
    do_get
    assigns[:items_mob].should equal(@items_mob)
  end
end

describe ItemsMobsController, " handling GET /items_mobs/1.xml" do

  before do
    @items_mob = mock_model(ItemsMob, :to_xml => "XML")
    ItemsMob.stub!(:find).and_return(@items_mob)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the items_mob requested" do
    ItemsMob.should_receive(:find).with("1").and_return(@items_mob)
    do_get
  end
  
  it "should render the found items_mob as xml" do
    @items_mob.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe ItemsMobsController, " handling GET /items_mobs/new" do

  before do
    @items_mob = mock_model(ItemsMob)
    ItemsMob.stub!(:new).and_return(@items_mob)
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
  
  it "should create an new items_mob" do
    ItemsMob.should_receive(:new).and_return(@items_mob)
    do_get
  end
  
  it "should not save the new items_mob" do
    @items_mob.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new items_mob for the view" do
    do_get
    assigns[:items_mob].should equal(@items_mob)
  end
end

describe ItemsMobsController, " handling GET /items_mobs/1;edit" do

  before do
    @items_mob = mock_model(ItemsMob)
    ItemsMob.stub!(:find).and_return(@items_mob)
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
  
  it "should find the items_mob requested" do
    ItemsMob.should_receive(:find).and_return(@items_mob)
    do_get
  end
  
  it "should assign the found ItemsMob for the view" do
    do_get
    assigns[:items_mob].should equal(@items_mob)
  end
end

describe ItemsMobsController, " handling POST /items_mobs" do

  before do
    @items_mob = mock_model(ItemsMob, :to_param => "1", :save => true)
    ItemsMob.stub!(:new).and_return(@items_mob)
  end
  
  def do_post
    post :create, :items_mob => {:name => 'ItemsMob'}
  end
  
  it "should create a new items_mob" do
    ItemsMob.should_receive(:new).with({'name' => 'ItemsMob'}).and_return(@items_mob)
    do_post
  end

  it "should redirect to the new items_mob" do
    do_post
    response.should redirect_to(items_mob_url("1"))
  end
end

describe ItemsMobsController, " handling PUT /items_mobs/1" do

  before do
    @items_mob = mock_model(ItemsMob, :to_param => "1", :update_attributes => true)
    ItemsMob.stub!(:find).and_return(@items_mob)
  end
  
  def do_update
    put :update, :id => "1"
  end
  
  it "should find the items_mob requested" do
    ItemsMob.should_receive(:find).with("1").and_return(@items_mob)
    do_update
  end

  it "should update the found items_mob" do
    @items_mob.should_receive(:update_attributes)
    do_update
    assigns(:items_mob).should equal(@items_mob)
  end

  it "should assign the found items_mob for the view" do
    do_update
    assigns(:items_mob).should equal(@items_mob)
  end

  it "should redirect to the items_mob" do
    do_update
    response.should redirect_to(items_mob_url("1"))
  end
end

describe ItemsMobsController, " handling DELETE /items_mobs/1" do

  before do
    @items_mob = mock_model(ItemsMob, :destroy => true)
    ItemsMob.stub!(:find).and_return(@items_mob)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the items_mob requested" do
    ItemsMob.should_receive(:find).with("1").and_return(@items_mob)
    do_delete
  end
  
  it "should call destroy on the found items_mob" do
    @items_mob.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the items_mobs list" do
    do_delete
    response.should redirect_to(items_mobs_url)
  end
end