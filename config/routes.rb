Rails.application.routes.draw do
  resources :rooms
  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/gameover', to: 'rooms#gameover', as: 'gameover'
  get '/users/:id/statistics', to: 'user#statistics', as: 'statistics'
  post '/newgame', to: 'rooms#newgame', as: 'newgame'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
