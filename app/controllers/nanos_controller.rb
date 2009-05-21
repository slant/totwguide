class NanosController < ApplicationController
  before_filter :login_required

  # GET /nanos
  # GET /nanos.xml
  def index
    @nanos = Nano.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @nanos.to_xml }
    end
  end

  # GET /nanos/1
  # GET /nanos/1.xml
  def show
    @nano = Nano.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @nano.to_xml }
    end
  end

  # GET /nanos/new
  def new
    @nano = Nano.new
  end

  # GET /nanos/1;edit
  def edit
    @nano = Nano.find(params[:id])
  end

  # POST /nanos
  # POST /nanos.xml
  def create
    @nano = Nano.new(params[:nano])

    respond_to do |format|
      if @nano.save
        flash[:notice] = 'Nano was successfully created.'
        format.html { redirect_to nano_url(@nano) }
        format.xml  { head :created, :location => nano_url(@nano) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nano.errors.to_xml }
      end
    end
  end

  # PUT /nanos/1
  # PUT /nanos/1.xml
  def update
    @nano = Nano.find(params[:id])

    respond_to do |format|
      if @nano.update_attributes(params[:nano])
        flash[:notice] = 'Nano was successfully updated.'
        format.html { redirect_to nano_url(@nano) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nano.errors.to_xml }
      end
    end
  end

  # DELETE /nanos/1
  # DELETE /nanos/1.xml
  def destroy
    @nano = Nano.find(params[:id])
    @nano.destroy

    respond_to do |format|
      format.html { redirect_to nanos_url }
      format.xml  { head :ok }
    end
  end

  # only allow nonbobs
  def authorize?
    current_account.admin == 1
  end
end
