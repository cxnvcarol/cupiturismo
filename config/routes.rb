CupiTurismo::Application.routes.draw do


  resources :posts

  resources :topics

  resources :forums

  match 'events/search', :controller => 'events', :action => 'search'
  match 'events/search_date/:trip_city_id', to: 'events#search_date', via: [:get]
  match 'events/search_advanced/:trip_city_id', to: 'events#search_advanced', via: [:get]
  match 'trips/upload_photo/:trip_id', to: 'trips#upload_photo'
  match 'trips/share/:id' => 'trips#share', :as => :share
  post  'trips/sendMail'
  post  'users/sendRMail'
  match 'users/recommend/:id' => 'users#recommend', :as => :recommend
  match 'users/act/:id' => 'users#act', :as => :act
  match 'events/search_results', :controller => 'events', :action => 'search_results'
  match 'events/add_eventful_event', :controller => 'events', :action => 'add_eventful_event'
  match 'trips/info_events/:id', :controller=>'trips',:action=>'info_events'
  match 'trips/all_events/:id', :controller=>'trips',:action=>'all_events'
  match 'trips/all', :controller=>'trips',:action=>'all'
  match 'trips/:id/cambiar_privacidad', :controller=>'trips',:action=>'cambiar_privacidad'
  match 'trip_cities/:id/show_readonly', :controller=>'trip_cities',:action=>'show_readonly'
  match 'trip_cities/info_events/:id', :controller=>'trip_cities',:action=>'info_events'
  match 'forums/:id' => 'Forums#index'


  resources :events

  resources :trip_cities do
    resources :events
  end

  resources :trips do
    collection do
      get :share
    end
  end

  resources :cities

  devise_for :users

  resources :users

  resources :trips  do
    resources :trip_cities
  end


  resources :users do
    collection do
      get :act
    end
  end

  resources :users do
    collection do
      get :act
    end
  end


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'trips#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
