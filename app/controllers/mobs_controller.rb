class MobsController < ApplicationController
  before_filter :login_required, :except => [ :index, :show ]

  # GET /mobs
  # GET /mobs.xml
  def index
    @mobs = Mob.find(:all, :order => "name asc")

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @mobs.to_xml }
    end
  end

  # GET /mobs/1
  # GET /mobs/1.xml
  def show
    @mob = Mob.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @mob.to_xml }
    end

  rescue
    logger.error("An invalid mob was requested: #{params[:id]}")
    flash[:notice] = "That is an invalid mob."
    redirect_to :action => 'index'
  end

  # GET /mobs/new
  def new
    @mob = Mob.new
  end

  # GET /mobs/1;edit
  def edit
    @mob = Mob.find(params[:id])
  end

  # POST /mobs
  # POST /mobs.xml
  def create
    @mob = Mob.new(params[:mob])

    respond_to do |format|
      if @mob.save
        flash[:notice] = 'Mob was successfully created.'
        format.html { redirect_to mob_url(@mob) }
        format.xml  { head :created, :location => mob_url(@mob) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mob.errors.to_xml }
      end
    end
  end

  # PUT /mobs/1
  # PUT /mobs/1.xml
  def update
    @mob = Mob.find(params[:id])

    respond_to do |format|
      if @mob.update_attributes(params[:mob])
        flash[:notice] = 'Mob was successfully updated.'
        format.html { redirect_to mob_url(@mob) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mob.errors.to_xml }
      end
    end
  end

  # DELETE /mobs/1
  # DELETE /mobs/1.xml
  def destroy
    @mob = Mob.find(params[:id])
    @mob.destroy

    respond_to do |format|
      format.html { redirect_to mobs_url }
      format.xml  { head :ok }
    end
  end

  # only allow nonbobs
  def authorize?
    current_account.admin == 1
  end
end
