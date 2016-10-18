Rails.application.routes.draw do

  get '/' => 'welcome#index'
  get '/things/(:thing)' => 'marketing#show', as: :marketing
  get '/chew/:flavor' => 'welcome#bubblegum'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
