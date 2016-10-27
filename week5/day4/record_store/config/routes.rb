Rails.application.routes.draw do

  resources :albums
  root 'albums#index'

  resources :artists do
    resources :albums
    member do
      get :rate
    end
    get "spin" => 'artists#spin'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
