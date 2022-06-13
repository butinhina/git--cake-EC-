Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords],controllers: {
    sessions: "admin/sessions"
  }


  devise_for :customers, skip: [:passwords],controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
  }
  root to: 'public/homes#top'
  get '/customers/my_page' => 'public/customers#show', as: 'my_page'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'

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
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end