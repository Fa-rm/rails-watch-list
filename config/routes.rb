Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create] # root "articles#index"
  end
  resources :bookmarks, only: [:destroy]
end
