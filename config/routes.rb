Rails.application.routes.draw do

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


  namespace :admin do
    root "homes#top"
    resources :items, only:[:index, :new, :create, :show, :edit,:update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    get 'admin/orders/:id' => 'admin/orders#show'
    patch 'admin/orders/:id' => 'admin/orders#update'
    patch 'admin/order_products/:id' => 'admin/order_products#update'
  end


  devise_for :admins
  devise_for :customers


end