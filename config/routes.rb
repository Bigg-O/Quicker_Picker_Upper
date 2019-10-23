Rails.application.routes.draw do
  resources :rooms
  resources :users
  get '/main' => 'rooms#main'
  get '/playgame' => 'rooms#playgame'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/gameover', to: 'rooms#gameover', as: 'gameover'
  get '/users/:id/statistics', to: 'users#statistics', as: 'statistics'
  post '/newgame', to: 'rooms#newgame', as: 'newgame'
  post '/drop_button', to: 'rooms#drop_button', as: 'drop_button'
  post '/pick_up_button', to: 'rooms#pick_up_button', as: 'pick_up_button'
  post '/clean_button', to: 'rooms#clean_button', as: 'clean_button'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end