Rails.application.routes.draw do
  get 'hello/index'
  #
 #resources :articles
 
 get '/articles',to: 'articles#index'
 get '/articles/new',to: 'articles#new'
 get '/articles/:created_at',to: 'articles#show'
 post '/articles',to: 'articles#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  SidekiqDemo::Application.routes.draw do
  get 'hello/index'

  get "hello/index"
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
end
