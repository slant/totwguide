class TempleController < ApplicationController
  def index
    @posts = Post.find(:all, :limit => 5, :order => "created_at desc")
  end

  def about
    @items = Item.find(:all)
    @mobs = Mob.find(:all)
  end

  def introduction
  end

  def map
  end

  def invalid_page
    flash[:notice] = "The web address you are attempting to access is no longer valid.<br />Please make note of the new address."
    redirect_to :controller => 'temple', :action => 'index'
  end
end
