Rails.application.routes.draw do
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :admin do
    root 'products#index' # /admin/ 後台根路徑
    resources :products, except: [:show]
    resources :vendors, except: [:show]
  end
  namespace :api do
    namespace :v1 do
      post 'subscribe', to: 'utils#subscribe'
    end
  end
end
