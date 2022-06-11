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
  get '/admin/items' => 'admin/items#index'
  get '/admin/items/new' => 'admin/items#new'
  get '/admin/items/:id' => 'admin/items#show', as: 'admin_item'
  post '/admin/item_infomations' => 'admin/items#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
