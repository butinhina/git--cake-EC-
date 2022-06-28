Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }

  get '/customers/edit' => 'public/customers#edit', as: 'customer_edit'
  patch 'customers' => 'public/customers#update', as: 'customer_update'
  devise_for :customers, skip: [:passwords],controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
  }
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about', as: 'about'

  get '/items' => 'public/items#index'
  get '/items/:id' => 'public/items#show', as: 'public_item'

  get '/cart_items' => 'public/cart_items#index', as: 'public_cart_items'
  post '/cart_items' => 'public/cart_items#create'
  patch '/cart_items/:id' => 'public/cart_items#update', as: 'cart_item_update'
  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'
  delete '/cart_items/:id' => 'public/cart_items#destroy', as: 'cart_item_destroy'



  get '/customers/my_page' => 'public/customers#show', as: 'my_page'

  get '/customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'


  get '/orders/new' => 'public/orders#new', as: 'order_new'
  post '/orders/confirm' => 'public/orders#confirm'
  get '/orders/complete' => 'public/orders#complete'
  post '/orders' => 'public/orders#create'
  get '/orders' => 'public/orders#index'
  get '/orders/:id' => 'public/orders#show', as: 'public_order'


  get '/addresses' => 'public/addresses#index'
  post '/addresses' => 'public/addresses#create'
  get '/addresses/:id/edit' => 'public/addresses#edit', as: 'address_edit'
  patch '/addresses/:id' => 'public/addresses#update', as: 'address_update'
  delete 'addresses/:id' => 'public/addresses#destroy', as: 'address_destroy'

  get '/admin' => 'admin/homes#top', as: 'admin'
  get '/admin/genres' => 'admin/genres#index'
  post '/admin/genres' => 'admin/genres#create'
  get '/admin/genres/:id/edit' => 'admin/genres#edit', as: 'genre_edit'
  patch '/admin/genres/:id' => 'admin/genres#update', as: 'genre_update'

  get '/admin/items' => 'admin/items#index'
  get '/admin/items/new' => 'admin/items#new'
  get '/admin/items/:id' => 'admin/items#show', as: 'admin_item'
  post '/admin/item_infomations' => 'admin/items#create'
  get '/admin/items/:id/edit' => 'admin/items#edit', as: 'item_edit'
  patch '/admin/items/:id' => 'admin/items#update', as: 'item_update'


  get '/admin/customers' => 'admin/customers#index'
  get '/admin/customers/:id' => 'admin/customers#show', as: 'admin_customer'
  get '/admin/customers/:id/edit' => 'admin/customers#edit', as: 'ad_customer_edit'
  patch '/admin/customers/:id' => 'admin/customers#update', as: 'ad_customer_update'

  get '/admin/orders/:id' => 'admin/orders#show', as: 'admin_order'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
