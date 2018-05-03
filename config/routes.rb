Rails.application.routes.draw do



  get 'pages/home'
  get 'pages/parsing'

  get 'articles', to: "references#articles"
  get 'pages', to: "references#pages"
  get 'tools', to: "references#tools"



resources :references, only: [ :new,  :create, :edit, :update ]

delete 'references/:id', to: "references#destroy", as: :references_delete


  root to: "references#articles"
end

