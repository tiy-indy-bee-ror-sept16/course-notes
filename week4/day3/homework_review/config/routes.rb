Rails.application.routes.draw do

  root 'welcome#index'
  # get '/' => 'welcome#index', as: :root
  get '/lipsum/:lipsum_wanted/(:num)' => 'welcome#lipsum', as: :zach
  get '/say_hello_to/:name' => 'welcome#show'
  get '/:name/(:id)' => 'welcome#show', as: :hello

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
