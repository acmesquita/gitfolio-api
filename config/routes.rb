Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/search', to: 'portfolio#search'
      post '/portfolio', to: 'portfolio#create'
    end
  end
end
