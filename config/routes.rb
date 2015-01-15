Rails.application.routes.draw do

  post 'comments/create' => 'comments#create'

  delete 'comments/:id' => 'comments#destroy'

  root 'static_pages#index'

  get 'hot' => 'static_pages#hot'
  get 'categorys/:id' => 'categorys#show', as: :category
  get 'great' => 'static_pages#great'

  devise_for :users
  get 'user/:id' => 'users#show', as: :user
  get 'user/:id/followers' => 'users#followers', as: :followers
  get 'user/:id/followeds' => 'users#followings', as: :followings

  resources :targets do
     resources :days
     member do
      post 'followed'
      patch 'unfollowed'
      patch 'like'
      patch 'unlike'
    end
  end

  resources :relationships, only: [:create, :destroy]

 
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
