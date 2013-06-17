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

  resources :arrival_logs, only: [:new, :create] do
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

    root :to => 'sessions#new'

    get 'want_select' => 'top#want_select'

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
      collection do
        get 'current'
      end
      member do
        put 'cancel'
        put 'check_in'
      end
    end


  end



end
