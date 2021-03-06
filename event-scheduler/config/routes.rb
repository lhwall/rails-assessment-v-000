Rails.application.routes.draw do
  resources :categories, only: [:show, :index] do
    resources :events, only: [:show, :index, :new]
  end

  resources :events, only: [:index, :show, :new, :create, :edit, :update]

  resources :users, only: [ :show, :new, :create] do
    resources :events, only: [:show, :index]
  end

  root "events#index"

  delete "logout" => "sessions#logout"
  get "login" => "sessions#login"
  post "login" => "sessions#login_user"
  get "chronological" => "events#chronological"
  get '/auth/github/callback' => 'sessions#create'
  get '/auth/twitter/callback' => 'sessions#create'
  get "location_show" => "events#location_show"
  get "location_index" => "events#location_index"
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
