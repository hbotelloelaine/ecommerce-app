Rails.application.routes.draw do
  devise_for :users

  root to: "products#index"
  resources :products
  post "/products/search", to: "products#search"



  # get "/products", to: "products#index"
  # get "/products/new", to: "products#new"
  # post "/products", to: "products#create"
  # get "/products/:id", to: "products#show"
  # get "/products/:id/edit", to: "products#edit"
  # patch "/products/:id", to: "products#update"
  # delete "/products/:id", to: 'products#destroy'
  # post "/products/search",to: "products#search"

  get '/carted_products', to: 'carted_products#index'
  post '/carted_products', to: 'carted_products#create'
  delete "/carted_products/:id", to: 'carted_products#destroy'

  post "/orders", to: 'orders#create'

  get "/orders/:id", to: 'orders#show'

  
  resources :suppliers



  # get '/suppliers', to: 'suppliers#index'
  # get '/suppliers', to: 'suppliers#new'
  # get '/suppliers:id', to: 'suppliers#show'




  # post "/orders" to: "orders#create"


  # get "/orders.id", to: "/orders#show"

  # get '/carted_products/new', to: 'carted_products#new'
  # get '/carted_products:id', to: 'carted_products#show'


  


  # delete "/products/:id", to: "products#show"
  # delete "request/:id", to: "products#destroy"

  
  # get "/add_product", to: "products#add_product"
  # post "/create_product", to: "products#create_product"
  # get "parameters", to: "products#parameters"
  # get "/parameters", to: "products#parameters"
  # get "/number_game", to: "products#number_game"
  # post "/form_result", to: "products#form_result"

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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
  
  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
