Rails.application.routes.draw do


get '/search', to: 'rooms#search'
post '/showroom', to: 'rooms#showroom'


  get 'sessions/new'
  get '/historybymember', to: 'roomhistories#historybymember'
  get '/schedule', to: 'rooms#schedule'

  get '/room_histories', to: 'room_histories#new'

  get '/rooms', to: 'rooms#index'

  get '/cancel', to: 'roomhistories#cancel'

  get '/allowmultibook', to: 'members#allowmultibook'
  get '/cancelmultibook', to: 'members#cancelmultibook'

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
  get '/room_add',   to: 'rooms#new'


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end