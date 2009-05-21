class AccountsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  # If you want "remember me" functionality, add this before_filter to Application Controller
  before_filter :login_from_cookie

  # render new.rhtml
  def new
    flash[:notice] = "Sorry! We are not allowing new account registration at this time."
    redirect_to :controller => 'temple', :action => 'index'
  end

  def create
    @account = Account.new(params[:account])
    @account.save!
    self.current_account = @account
    redirect_back_or_default('/')
    flash[:notice] = "Your account has successfully been created!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end
end
