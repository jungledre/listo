Rails.application.routes.draw do

  root 'site#index'

  get 'about' => 'site#about'

  get 'faq' => 'site#faq'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  resources :users, :except => [:new, :index]
  get 'signup' => 'users#new'
  get 'users/:id/dashboard' => 'users#dashboard', as: :dashboard
  post 'users/:id/flag' => 'users#flag', as: :flag

  post 'events' => 'events#create'
  get 'events/:id' => 'events#show'
  post 'users/:id/flake' => 'events#flake', as: :flake


  get 'messages' => 'messages#create'
  delete 'messages/:id' => 'messages#destroy'

  get 'activities' => 'activities#index'

  get '*path' => redirect('/')

end