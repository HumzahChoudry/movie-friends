Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'user#home'

  get "/login", to: 'session#new'
  get "/logout", to: 'session#destroy'

  get "/signup", to: 'user#new'
  post "/users", to: 'user#create'
  get '/edit', to: 'user#edit'
  patch '/users/:id', to: 'user#update'
  delete '/users/:id', to: 'user#destroy'


  get "/movies", to: 'movies#index'
  get "/movies/new", to: 'movies#new', as: "new_movie"
  post "/movies", to: 'movies#create'
  get "/movies/:movie", to: 'movie#show', as: "movie"
  get "/movies/:movie/edit", to: 'movie#edit', as: "edit_movie"
  patch "/movies/:movie", to: 'movie#update'
  get "/movies/:movie/:group", to: 'movie#show_group_filter', as: "movie_group"
  delete '/movies/:movie', to: 'movie#destroy'


  get "/groups", to: 'groups#index'
  get "/groups/new", to: 'groups#new', as: "new_group"
  post "/groups", to: 'groups#create'
  get "/groups/:group", to: 'group#show', as: "group"
  get "/groups/:group/edit", to: 'group#edit', as: "edit_group"
  patch "/groups/:group", to: 'group#update'
  get "/groups/:group/:movie", to: 'group#show_movie_filter', as: "group_movie"
  delete '/groups/:group', to: 'group#destroy'

end
