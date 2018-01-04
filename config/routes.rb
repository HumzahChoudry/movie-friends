Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static#welcome'

  get "/home", to: 'users#home'

  get "/login", to: 'sessions#new'
  post "/sessions", to: 'sessions#create'
  get "/logout", to: 'sessions#destroy'

  get "/signup", to: 'users#new'
  post "/users", to: 'users#create'
  get '/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'


  get "/movies", to: 'movies#index'
  get "/movies/new", to: 'movies#new', as: "new_movie"
  post "/movies", to: 'movies#create'
  get "/movies/:movie", to: 'movies#show', as: "movie"
  get "/movies/:movie/edit", to: 'movies#edit', as: "edit_movie"
  patch "/movies/:movie", to: 'movies#update'
  get "/movies/:movie/:group", to: 'movies#show_group_filter', as: "movie_group"
  delete '/movies/:movie', to: 'movies#destroy'


  get "/groups", to: 'groups#index'
  get "/groups/new", to: 'groups#new', as: "new_group"
  post "/groups", to: 'groups#create'
  get "/groups/:group", to: 'groups#show', as: "group"
  get "/groups/:group/edit", to: 'groups#edit', as: "edit_group"
  patch "/groups/:group", to: 'groups#update'
  get "/groups/:group/:movie", to: 'groups#show_movie_filter', as: "group_movie"
  delete '/groups/:group', to: 'groups#destroy'

  get "/comments/:id", to: 'comments#show', as: "comment"
  post "/comments", to: 'comments#create'
  patch "/comments/:id", to: 'comments#update'
  delete "/comments/:id", to: 'comments#destroy'

end
