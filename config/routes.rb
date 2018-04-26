Rails.application.routes.draw do



  get 'articles', to: "references#articles"
  get 'pages', to: "references#pages"
  get 'ressources', to: "references#ressources"



resources :references, only: [ :new,  :create, :edit, :update ]

delete 'references/:id', to: "references#destroy", as: :references_delete


  root to: "references#articles"
end

