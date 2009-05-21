class ItemsMobsController < ApplicationController
  before_filter :login_required

  # GET /items_mobs
  # GET /items_mobs.xml
  def index
    @items_mobs = ItemsMob.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @items_mobs.to_xml }
    end
  end

  # GET /items_mobs/1
  # GET /items_mobs/1.xml
  def show
    @items_mob = ItemsMob.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @items_mob.to_xml }
    end
  end

  # GET /items_mobs/new
  def new
    @items_mob = ItemsMob.new
  end

  # GET /items_mobs/1;edit
  def edit
    @items_mob = ItemsMob.find(params[:id])
  end

  # POST /items_mobs
  # POST /items_mobs.xml
  def create
    @items_mob = ItemsMob.new(params[:items_mob])

    respond_to do |format|
      if @items_mob.save
        flash[:notice] = 'ItemsMob was successfully created.'
        format.html { redirect_to items_mob_url(@items_mob) }
        format.xml  { head :created, :location => items_mob_url(@items_mob) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @items_mob.errors.to_xml }
      end
    end
  end

  # PUT /items_mobs/1
  # PUT /items_mobs/1.xml
  def update
    @items_mob = ItemsMob.find(params[:id])

    respond_to do |format|
      if @items_mob.update_attributes(params[:items_mob])
        flash[:notice] = 'ItemsMob was successfully updated.'
        format.html { redirect_to items_mob_url(@items_mob) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @items_mob.errors.to_xml }
      end
    end
  end

  # DELETE /items_mobs/1
  # DELETE /items_mobs/1.xml
  def destroy
    @items_mob = ItemsMob.find(params[:id])
    @items_mob.destroy

    respond_to do |format|
      format.html { redirect_to items_mobs_url }
      format.xml  { head :ok }
    end
  end

  # only allow nonbobs
  def authorize?
    current_account.admin == 1
  end
end
