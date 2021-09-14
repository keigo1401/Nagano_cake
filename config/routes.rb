Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }

  scope module: 'public' do
  root "homes#top"
  get 'homes/about' => 'homes#about'
  resources :items, only:[:index, :show]

  resources :customers, only:[:show, :edit, :update]
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw'

  resources :cart_items, only:[:index, :update, :create, :destroy]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

  resources :orders, only:[:index, :show, :new, :create]
  get 'orders/thanks' => 'orders#thanks'
  post 'orders/confirm' => 'orders#confirm'

  resources :address, only:[:index, :edit, :create, :update, :destroy]

  end


  namespace :admin do
    root "homes#top"
    resources :items, only:[:index, :new, :create, :show, :edit,:update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    get 'orders/:id' => 'orders#show'
    patch 'orders/:id' => 'orders#update'
    patch 'order_products/:id' => 'order_products#update'

  end


end