Rails.application.routes.draw do
  root 'products#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resource :cart, only: [:show, :destroy] do
    collection do
      get :checkout
    end
  end
  resources :orders, except: [:new, :edit, :update, :destroy]
  namespace :admin do
    root 'products#index' # /admin/ 後台根路徑
    resources :products, except: [:show]
    resources :vendors, except: [:show]
    resources :categories, except: [:show] do
      collection do
        put 'sort'
      end
    end
  end
  namespace :api do
    namespace :v1 do
      post 'subscribe', to: 'utils#subscribe'
      post 'cart', to: 'utils#cart'
    end
  end
end
