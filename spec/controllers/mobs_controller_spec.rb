require File.dirname(__FILE__) + '/../spec_helper'

describe MobsController, "#route_for" do

  it "should map { :controller => 'mobs', :action => 'index' } to /mobs" do
    route_for(:controller => "mobs", :action => "index").should == "/mobs"
  end
  
  it "should map { :controller => 'mobs', :action => 'new' } to /mobs/new" do
    route_for(:controller => "mobs", :action => "new").should == "/mobs/new"
  end
  
  it "should map { :controller => 'mobs', :action => 'show', :id => 1 } to /mobs/1" do
    route_for(:controller => "mobs", :action => "show", :id => 1).should == "/mobs/1"
  end
  
  it "should map { :controller => 'mobs', :action => 'edit', :id => 1 } to /mobs/1;edit" do
    route_for(:controller => "mobs", :action => "edit", :id => 1).should == "/mobs/1;edit"
  end
  
  it "should map { :controller => 'mobs', :action => 'update', :id => 1} to /mobs/1" do
    route_for(:controller => "mobs", :action => "update", :id => 1).should == "/mobs/1"
  end
  
  it "should map { :controller => 'mobs', :action => 'destroy', :id => 1} to /mobs/1" do
    route_for(:controller => "mobs", :action => "destroy", :id => 1).should == "/mobs/1"
  end
  
end

describe MobsController, " handling GET /mobs" do

  before do
    @mob = mock_model(Mob)
    Mob.stub!(:find).and_return([@mob])
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
  
  it "should find all mobs" do
    Mob.should_receive(:find).with(:all).and_return([@mob])
    do_get
  end
  
  it "should assign the found mobs for the view" do
    do_get
    assigns[:mobs].should == [@mob]
  end
end

describe MobsController, " handling GET /mobs.xml" do

  before do
    @mob = mock_model(Mob, :to_xml => "XML")
    Mob.stub!(:find).and_return(@mob)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all mobs" do
    Mob.should_receive(:find).with(:all).and_return([@mob])
    do_get
  end
  
  it "should render the found mobs as xml" do
    @mob.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MobsController, " handling GET /mobs/1" do

  before do
    @mob = mock_model(Mob)
    Mob.stub!(:find).and_return(@mob)
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
  
  it "should find the mob requested" do
    Mob.should_receive(:find).with("1").and_return(@mob)
    do_get
  end
  
  it "should assign the found mob for the view" do
    do_get
    assigns[:mob].should equal(@mob)
  end
end

describe MobsController, " handling GET /mobs/1.xml" do

  before do
    @mob = mock_model(Mob, :to_xml => "XML")
    Mob.stub!(:find).and_return(@mob)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the mob requested" do
    Mob.should_receive(:find).with("1").and_return(@mob)
    do_get
  end
  
  it "should render the found mob as xml" do
    @mob.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MobsController, " handling GET /mobs/new" do

  before do
    @mob = mock_model(Mob)
    Mob.stub!(:new).and_return(@mob)
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
  
  it "should create an new mob" do
    Mob.should_receive(:new).and_return(@mob)
    do_get
  end
  
  it "should not save the new mob" do
    @mob.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new mob for the view" do
    do_get
    assigns[:mob].should equal(@mob)
  end
end

describe MobsController, " handling GET /mobs/1;edit" do

  before do
    @mob = mock_model(Mob)
    Mob.stub!(:find).and_return(@mob)
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
  
  it "should find the mob requested" do
    Mob.should_receive(:find).and_return(@mob)
    do_get
  end
  
  it "should assign the found Mob for the view" do
    do_get
    assigns[:mob].should equal(@mob)
  end
end

describe MobsController, " handling POST /mobs" do

  before do
    @mob = mock_model(Mob, :to_param => "1", :save => true)
    Mob.stub!(:new).and_return(@mob)
  end
  
  def do_post
    post :create, :mob => {:name => 'Mob'}
  end
  
  it "should create a new mob" do
    Mob.should_receive(:new).with({'name' => 'Mob'}).and_return(@mob)
    do_post
  end

  it "should redirect to the new mob" do
    do_post
    response.should redirect_to(mob_url("1"))
  end
end

describe MobsController, " handling PUT /mobs/1" do

  before do
    @mob = mock_model(Mob, :to_param => "1", :update_attributes => true)
    Mob.stub!(:find).and_return(@mob)
  end
  
  def do_update
    put :update, :id => "1"
  end
  
  it "should find the mob requested" do
    Mob.should_receive(:find).with("1").and_return(@mob)
    do_update
  end

  it "should update the found mob" do
    @mob.should_receive(:update_attributes)
    do_update
    assigns(:mob).should equal(@mob)
  end

  it "should assign the found mob for the view" do
    do_update
    assigns(:mob).should equal(@mob)
  end

  it "should redirect to the mob" do
    do_update
    response.should redirect_to(mob_url("1"))
  end
end

describe MobsController, " handling DELETE /mobs/1" do

  before do
    @mob = mock_model(Mob, :destroy => true)
    Mob.stub!(:find).and_return(@mob)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the mob requested" do
    Mob.should_receive(:find).with("1").and_return(@mob)
    do_delete
  end
  
  it "should call destroy on the found mob" do
    @mob.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the mobs list" do
    do_delete
    response.should redirect_to(mobs_url)
  end
end