Rails.application.routes.draw do
  resources :shopping_trips
  resources :sleeping_patterns
  resources :books
  resources :musics
  resources :users
  resources :user_books
  resources :user_musics
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
