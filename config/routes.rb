Bugtracker::Application.routes.draw do
  

  # The priority is based upon order of creation:
  # first created -> highest priority.
  
  get '/login' => 'sessions#show'
  post '/login' => 'sessions#create'
  
  # Allowing GETs for logout for user convenience, but no links to /logout should exist
  # except those that use POST
  match '/logout' => 'sessions#destroy'
  
  #Also including RESTful routing
  resource :session, :only => [:show, :create, :destroy]
  resources :bugs, :only => [:index, :show, :new, :create]
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "bugs#index"

  # See how all your routes lay out with "rake routes"
end
