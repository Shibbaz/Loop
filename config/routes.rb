Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  mount RailsEventStore::Browser => '/res' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
