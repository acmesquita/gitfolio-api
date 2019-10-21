Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/search', to: 'portfolio#search'
    end
  end
end
