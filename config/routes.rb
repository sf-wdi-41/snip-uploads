Rails.application.routes.draw do
  get 'documents'             => 'documents#index', as: 'uploads'
  post 'documents'            => 'documents#create'
  get 'document/:id'          => 'documents#show',      as: 'document'
  get 'document/download/:id' => 'documents#download',  as: 'download'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'documents#index'
end
