Rails.application.routes.draw do

 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get '/' => 'sessions#new'
  post '/new_user' => 'sessions#create'
  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#destroy'

  get '/pets' => 'pets#main'
  get '/pets/new' => 'pets#new'
  post '/pets/new' => 'pets#create'
  get '/pets/show/:id' => 'pets#show'
  post '/pets/show/skill' => 'pets#create_skill'
  get '/pets/edit/:id' => 'pets#edit_pet'
  patch '/pets/edit/:id' => 'pets#edit'
  delete '/pets/destroy/:id' => 'pets#destroy'

  get '/chat/:id' => 'chats#new'
  post '/chat/:id' => 'chats#create'
  
  
end
