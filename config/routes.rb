# coding: utf-8

Aitel::Application.routes.draw do

  root :to => 'vips#index'

  resources :users do
  end

  resources :reserves, only: [:index] do
    member do
      put 'accept'
      put 'reject'
    end
  end

  resources :shops do
  end

  resources :vips do
  end
  resources :messages do
  end

  resources :vip_requests, only: [:index, :show, :new, :create, :update, :destroy] do
    get 'targets_for', on: :collection
  end

  resources :sessions, only: [:new]do
  end
  resource :session, only: [:create, :destroy] do
  end

  resources :answers, only: [:index] do
    member {put "consent", "reject"} # 了解, 拒否
  end


  # お客側
  namespace :customer do

    root :to => 'users#index'

    resources :sessions, only: [:new] do
    end
    resource :session, only: [:create, :destroy] do
    end

    resources :users do
    end

    resources :shops, only: [:index] do
    end

    resources :messages, only: [:index, :show] do
    end

    resources :vip_requests, only: [:index] do
      member {put "approve", "reject"} # 承認, 拒否
    end

    resources :wants, only:[ :new, :create ] do
    end

    resources :answers, only: [:index] do
    end

    resources :reserves, only: [:create, :show] do
      member do
        put 'cancel'
        put 'check_in'
      end
    end


  end



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
  # match ':controller(/:action(/:id))(.:format)'
end
