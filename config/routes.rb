Rails.application.routes.draw do
  get 'pages/index'

  get 'pages/show'

  get 'pages/new'

  get 'pages/create'

  get 'pages/edit'

  get 'pages/update'

  get 'pages/destroy'

  get 'articles/index'

  get 'articles/new'

  get 'articles/create'

  get 'articles/edit'

  get 'articles/update'

  get 'articles/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :pages
end
