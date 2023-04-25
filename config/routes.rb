Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/api/v1/articles/search/:title", to: "api/v1/articles#search"
  get "/api/v1/comments/search/:comment", to: "api/v1/comments#search"
  namespace "api" do
    namespace "v1" do
      resources :articles do
        get '/page/:page', action: :index, on: :collection
        resources :comments do
          get '/page/:page', action: :index, on: :collection
        end
      end
    end
  end
end