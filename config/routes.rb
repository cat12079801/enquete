Rails.application.routes.draw do
  root 'games#index'
  resources :games, :only => [:index] do
    member do
      get  '' => 'games#show'
      post '' => 'games#receive', :as => 'collect'
    end
  end

  scope :admin do
    get    'sign_in'  => 'admin#sign_in'
    post   'sign_in'  => 'admin#sign_create'
    delete 'sign_out' => 'admin#sign_out'
    get    '/'        => 'admin#index'
    get    'index'    => redirect('/admin')
    resources :games, :controller => 'admin/games', :as => 'admin_games'
    resources :authors, :controller => 'admin/authors', :as => 'admin_authors'
  end

  get '/login' => redirect('/admin/sign_in')
  get '/sign_in' => redirect('/admin/sign_in')
  get '/admin/login' => redirect('/admin/sign_in')

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
