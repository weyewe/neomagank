Neomagank::Application.routes.draw do
  
  devise_for :companies

  devise_for :users

  root :to => 'home#show'
  match 'profile/execute_crop_profile_pic' => "profiles#crop", :as => :crop_profile_image
  match 'model/:model_id' => "home#show_public", :as => :show_public
  match 'model/:model_id/portfolio/:portfolio_id'  => "portfolios#show_public", :as => :model_portfolio_url
  match 'profile/check_crop_result/:profile_id' => "profiles#check_crop_result", :as => :check_crop_result
  
  
  resources :users do
    resources :portfolios
  end
  
  resources :jobs

  resources :portfolios do 
    resources :portfolio_images
  end

  resources :profiles
  resources :work_experiences
  resources :skills
  resources :educations
  resources :portfolios
  
  match 'edit_credential' => "passwords#edit_credential" , :as => :edit_credential
  match 'update_password' => "passwords#update" , :as => :update_password, :method => :put
  
  
  
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
