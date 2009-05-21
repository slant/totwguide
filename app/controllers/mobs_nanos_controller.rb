class MobsNanosController < ApplicationController
  before_filter :login_required

  # GET /mobs_nanos
  # GET /mobs_nanos.xml
  def index
    @mobs_nanos = MobsNano.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @mobs_nanos.to_xml }
    end
  end

  # GET /mobs_nanos/1
  # GET /mobs_nanos/1.xml
  def show
    @mobs_nano = MobsNano.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @mobs_nano.to_xml }
    end
  end

  # GET /mobs_nanos/new
  def new
    @mobs_nano = MobsNano.new
  end

  # GET /mobs_nanos/1;edit
  def edit
    @mobs_nano = MobsNano.find(params[:id])
  end

  # POST /mobs_nanos
  # POST /mobs_nanos.xml
  def create
    @mobs_nano = MobsNano.new(params[:mobs_nano])

    respond_to do |format|
      if @mobs_nano.save
        flash[:notice] = 'MobsNano was successfully created.'
        format.html { redirect_to mobs_nano_url(@mobs_nano) }
        format.xml  { head :created, :location => mobs_nano_url(@mobs_nano) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mobs_nano.errors.to_xml }
      end
    end
  end

  # PUT /mobs_nanos/1
  # PUT /mobs_nanos/1.xml
  def update
    @mobs_nano = MobsNano.find(params[:id])

    respond_to do |format|
      if @mobs_nano.update_attributes(params[:mobs_nano])
        flash[:notice] = 'MobsNano was successfully updated.'
        format.html { redirect_to mobs_nano_url(@mobs_nano) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mobs_nano.errors.to_xml }
      end
    end
  end

  # DELETE /mobs_nanos/1
  # DELETE /mobs_nanos/1.xml
  def destroy
    @mobs_nano = MobsNano.find(params[:id])
    @mobs_nano.destroy

    respond_to do |format|
      format.html { redirect_to mobs_nanos_url }
      format.xml  { head :ok }
    end
  end

  # only allow nonbobs
  def authorize?
    current_account.admin == 1
  end
end
