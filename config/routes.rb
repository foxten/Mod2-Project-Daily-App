Rails.application.routes.draw do
  resources :shopping_trips
  resources :sleeping_patterns
  resources :books
  resources :musics
  resources :users
  resources :user_books
  resources :user_musics


  get '/session/new', to: 'session#new', as: 'new_session'
  post '/session/new', to: 'session#logged_in'
  delete '/session/logout', to: 'session#logout'
  
  post '/books/:id/add_a_book', to: 'books#add_a_book'
  post '/books/:id/remove_from_my_shelf', to: 'books#remove_from_my_shelf'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
