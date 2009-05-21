ActionController::Routing::Routes.draw do |map|
  map.resources *%w[ items mobs nanos posts items_mobs mobs_nanos accounts sessions ]

  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
  map.connect 'itemlist.php', :controller => 'temple', :action => 'invalid_page'
  map.connect 'itemlist-type.php', :controller => 'temple', :action => 'invalid_page'
  map.connect 'intro.php', :controller => 'temple', :action => 'invalid_page'
  map.connect 'itemlist-profession.php', :controller => 'temple', :action => 'invalid_page'
  map.connect 'map.php', :controller => 'temple', :action => 'invalid_page'
  map.connect 'moblist.php', :controller => 'temple', :action => 'invalid_page'
  map.connect 'itemguides.php', :controller => 'temple', :action => 'invalid_page'

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)
  map.register 'register', :controller => 'accounts', :action => 'new'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  map.connect '', :controller => "temple"

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
