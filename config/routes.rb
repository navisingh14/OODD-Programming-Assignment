Rails.application.routes.draw do

  get 'sessions/new'

  get 'admins/new'

#  get 'members/new'
resources :members
 
 root 'welcome#index'
 get  '/signup',  to: 'members#new'
 post '/signup',  to: 'members#create'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get '/signup_admin', to: 'admins#new'
 post '/signup_admin', to: 'admins#create'
 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy'
 resources :admins


end
