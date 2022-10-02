Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "end_user/registrations",
    sessions: 'end_user/sessions'
  }
  
  root to: 'end_user/homes#top'
  get '/about' => 'end_user/homes#about'
  resources :items, only: [:index, :show], controller: 'end_user/items'
  get '/end_users/mypage', to: 'end_user/end_users#show'
  get '/end_users/edit', to: 'end_user/end_users#edit'        
  patch '/end_users', to: 'end_user/end_users#update'        
  get '/end_users/confirm', to: 'end_user/end_users#confirm'        
  patch '/end_users/withdraw', to: 'end_user/end_users#withdraw'        
  resources :cart_items, except: [:new, :show, :edit], controller: 'end_user/cart_items'
  get '/cart_items/destroy_all' => 'end_user/cart_items#destroy_all'
  resources :orders, except: [:edit, :update, :destroy], controller: 'end_user/orders'
  get '/orders/confirm' => 'end_user/orders#confirm'
  get '/orders/complete' => 'end_user/orders#complete'
  resources :addresses, except: [:new, :show], controller: 'end_user/addresses'

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
      get '/' => 'homes#top'
      resources :items, except: [:destroy]
      resources :genres, except: [:new, :show, :destroy]
      resources :end_users, except: [:new, :create, :destroy]
      resources :orders, only: [:show, :update]
      resources :order_details, only: [:update]
  end
end
