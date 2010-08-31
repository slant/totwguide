class ApplicationController < ActionController::Base
  include HoptoadNotifier::Catcher
  include AuthenticatedSystem

  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_temple_session_id'
end
