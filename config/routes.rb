Rails.application.routes.draw do

  get 'books/subscribe'
  get 'books/unsubscribe'

  resources :books
  get 'books/index'

  get 'books/new'

  post 'books/create'

  get 'books/show'

  get 'books/edit'

  post 'books/update'

  delete 'books/destroy'

  devise_for :users
  resources :users
  
  get 'users/index'

  post 'users/create'

  post 'users/update'
  
  get 'users/new'

  get 'users/show'

  delete 'users/destroy'

  get 'users/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
