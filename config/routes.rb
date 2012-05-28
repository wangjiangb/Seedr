Bigdata::Application.routes.draw do
  resources :suggested_keywords
    
  get "getstarted/twitter"

  get "getstarted/topic"

  get "getstarted/welcome"
  
  get "getstartedtwitter/new"
  get "getstartedtwitter/callback"
  resources :friends_withs

  resources :rss_sources

  resources :comments

  resources :twitter_accounts

  get "analytics/index"

  get "settings/index"

  post "twitter_accounts/new"
  get "twitter_accounts/new"
  resources :search_bins
  get "search_bins/new"

  get "search_bins/create"

  post "search_bins/new"

resource :twitter_account
  match '/callback/twitter/' => "twitter_accounts#callback", :as => :twitter_callback

  resources :users

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  post "sessions/new"
    
    post "sessions/create"

  get "admin/index"

  get "twitter_manager/post"
   
  resources :l_tweets

  get "reader/index"
  post "reader/update_news"
  get  "reader/update_news"
  get "reader/setting"

  get "reader/analytics"

  resources :landing_page	
	
  get "landing_page/index"
	
  resources :visitors
  
  get 'admin' => 'reader#index'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end

  get "aboutus/about"
  get "register/reg"
  get "home/index"
  get "home/register"
  get "home/about"
  resources :cohorts
  resources :prospective_users
  get "prospective_users/new"

  root :to => 'landing_page#index'
  #root :to => 'reader#index', :as  => 'home'
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
  # root :to => 'welcome#index'
	#root :to => "home#index"
	#root :to => "landingpage#index"
	#match "about" => "aboutus#about"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
