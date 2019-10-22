Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/search', to: 'portfolio#search'
      get '/show/:id', to: 'portfolio#show'
      post '/portfolio', to: 'portfolio#create'
    end
  end
end
