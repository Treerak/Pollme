Rails.application.routes.draw do

  post '/poll/create' , to: 'poll#create', as: 'poll_create'
  get '/poll/new', to:'poll#new', as: 'poll_new'
  get '/poll/show:id', to:'poll#show', as: 'poll_show'
  #get '/poll/two', to:'poll#two', as: 'poll_two'
  #post '/poll/create_session', to:'poll#create_session', as: 'poll_create_session'
  get '/poll/index', to:'poll#index', as: 'poll_index'
end
