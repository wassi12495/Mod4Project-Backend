Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :fixtures
      resources :teams
      resources :leagues
      resources :users
      resources :auth
      post "/favorites/team", to: "favorites#create_team"
      post "/favorites/league", to: "favorites#create_league"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
