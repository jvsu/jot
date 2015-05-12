Rails.application.routes.draw do
  get 'homes/index'

  get 'notes/new'

  get 'notes/create'

  get 'notes/retrieve/:notes_id' =>"notes#retrieve"

  get 'notes/udpate'

  get 'notes/destroy'


  get 'collections/retrieve'

  get 'collections/update'

  get 'collections/destroy'

  get 'sessions/index'

  get 'sessions/sign_up'

  get 'sessions/sign_in'

  get 'session/index'

  get 'session/sign_in'

  get 'session/sign_up'

    root to: "sessions#index"
    match '/sessions/sign_up'=>'sessions#sign_up', :via=>[:get,:post]
    match '/sessions/sign_in'=>'sessions#sign_in', :via=>[:get,:post]
    match '/homes/index'=>'homes#index', :via=>[:get,:post]
    match '/sessions/destroy'=>'sessions#destroy', :via=>[:get,:post]
    match '/collections/create/'=>'collections#create', :via=>[:get,:post]
    match '/notes/create/'=>'notes#create', :via=>[:get,:post]
    get '/notes/new/:collection_id' => 'notes#new';
    match '/notes/update/' => 'notes#update', :via=>[:get,:post];
    get '/notes/destroy/:note_id/:collection_id' => 'notes#destroy';
    match '/collections/all/' => 'collections#all', :via=>[:get,:post];
    get '/collections/destroy/:collection_id' => 'collections#destroy';

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
