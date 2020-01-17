Rails.application.routes.draw do
  namespace :api do
   get '/shoes' => 'products#index'
   post '/shoes' => 'products#create'
   get '/shoes/:id' => 'products#show'
   patch '/shoes/:id' => 'products#update'
   delete '/shoes/:id' => 'products#destroy'
  end
end
