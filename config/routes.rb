Rails.application.routes.draw do
  # Devise

  # Use our own controller so that the sign up form also takes in a username field
  devise_for :users, :controllers => { registrations: 'registrations' }

  # /post/id displays post with given id
  get '/post/:id', to: 'posts#show', as: 'post'

  # unsecured_pages controller
  get '/data' => 'unsecured_pages#data'

  # static_pages_controller
  get '/roulette' => 'static_pages#roulette'
  get '/submit' => 'static_pages#submit'
  

  # posts_controller
  get '/post' => 'posts#post'
  get '/browse' => 'posts#browse'

  # users_controller
  get '/user' => 'users#user'

  # roulettes_controller
  get '/results' => 'roulettes#results'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'users#user'
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  #resources :users
  resources :posts
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



p = Post.new
p.title = @title
...
p.save