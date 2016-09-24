Rails.application.routes.draw do

  get '/room_histories', to: 'room_histories#new'

  get '/rooms', to: 'rooms#new'

  get 'sessions/new'

#  get 'members/new'
resources :members
resources :rooms
resources :roomhistories

root 'welcome#index'
get  '/signup',  to: 'members#new'
post '/signup',  to: 'members#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end