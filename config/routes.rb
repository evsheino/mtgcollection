Mtgcollection::Application.routes.draw do

  resources :loans

  resources :payments do
    post 'create_or_update', on: :collection
  end

  resources :traded_cards
  post 'traded_cards/create_or_update', to: 'traded_cards#create_or_update'

  resources :trades do
    post 'add_card', on: :member
    post 'add_payment', on: :member
    post 'execute', on: :member
    get 'edit_details', on: :member
    get 'list_cards', on: :member
  end

  resources :owned_cards do
    post 'add', on: :member
    post 'deduct', on: :member
    post 'loan', on: :member
  end

  resources :printings
  get 'data/printing_list', to: 'printings#card_list'

  resources :expansions

  resources :users
  get 'data/user_list', to: 'users#list'

  resources :cards

  resources :sessions

  resources :mtg_db_cards do
    post 'add_to_collection', on: :member
    post 'deduct_from_collection', on: :member
  end
  post 'mtg_db_cards/borrow', to: 'mtg_db_cards#borrow'

  resources :mtg_db_sets

  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  delete 'signout' => 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'owned_cards#index'

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
