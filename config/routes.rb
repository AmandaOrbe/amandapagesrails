Rails.application.routes.draw do
  # get 'pages/index'

  # get 'pages/show'

  # get 'pages/new'

  # get 'pages/create'

  # get 'pages/edit'

  # get 'pages/update'

  # get 'pages/destroy'

  # get 'articles', to: "articles#index"

  # get 'articles/new', to: "articles#new"

  # post 'articles', to: "articles#create"

  # get 'articles/:id/edit', to: "articles#edit" , as: :edit

  # patch 'articles/:id',  to: "articles#update"


resources :articles, only: [:index, :new, :create, :edit, :update ]

delete 'articles/:id', to: "articles#destroy", as: :articles_delete



resources :pages, only: [:index, :show, :new, :create, :edit, :update ]

delete 'pages/:id', to: "pages#destroy", as: :pages_delete
  # #READ
  #   get 'restaurants', to: 'restaurants#index'
  #   get 'restaurants/:id', to: 'restaurants#show', as: :restaurant
  # #CREATE
  #   get 'restaurants/new', to: 'restaurants#new'
  #   post 'restaurants', to: 'restaurants#create'
  # #UPDATE
  #   get "restaurants/:id/edit", to: "restaurants#edit"
  #   patch "restaurants/:id", to: "restaurants#update"
  # #DELETE
  #   delete "restaurants/:id", to: "restaurants#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
