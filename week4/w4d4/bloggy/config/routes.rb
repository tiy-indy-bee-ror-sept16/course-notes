Rails.application.routes.draw do

  root 'posts#index'

  get '/posts/:id' => 'posts#show', as: :post

  get '/authors/:id' => 'authors#show', as: :author

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
