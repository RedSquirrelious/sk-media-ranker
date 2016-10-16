Rails.application.routes.draw do
 root to: 'media#index'

  get 'media/index' => 'media#index', as: 'index'

  get 'media/show/:id' => 'media#show', as: 'show'

  get 'albums' => 'media#show_albums', as: 'albums'

  get 'books' => 'media#show_books', as: 'books'

  get 'movies' => 'media#show_movies', as: 'movies'


  get 'media/new' => 'media#new', as: 'new'

  post 'media/create' => 'media#create', as: 'create'

  get 'media/:id/edit/' => 'media#edit', as: 'edit'

  put 'media/:id/update' => 'media#update', as: 'update'

  delete 'media/:id/delete' => 'media#destroy', as: 'delete'

  post 'media/:id/downvote' => 'media#downvote', as: 'downvote'

  post 'media/:id/upvote' => 'media#upvote', as: 'upvote'


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
