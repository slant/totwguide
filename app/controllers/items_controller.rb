class ItemsController < ApplicationController
  before_filter :login_required, :except => [ :index, :show ]

  # GET /items
  # GET /items.xml
  def index
    @items = Item.find(:all, :order => "name asc")
    @items_by_category = @items.group_by { |i| i.category }
    @items_by_profession = @items.group_by { |i| i.profession }

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @items.to_xml }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @item.to_xml }
    end
    
  rescue
    logger.error("An invalid item was requested: #{params[:id]}")
    flash[:notice] = 'That is an invalid item.'
    redirect_to :action => 'index'
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1;edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to item_url(@item) }
        format.xml  { head :created, :location => item_url(@item) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors.to_xml }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to item_url(@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors.to_xml }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.xml  { head :ok }
    end
  end

  # only allow nonbobs
  def authorize?
    current_account.admin == 1
  end
end
