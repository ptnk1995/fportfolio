Rails.application.routes.draw do
  post "/rate" => "rater#create", as: "rate"
  devise_for :users, controllers: {omniauth_callbacks: "callbacks",
    registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    resources :projects
    resources :users
    resources :participates
    resources :likes
    resources :comments
    resources :news
    resources :blogs
    resources :chats
    resources :messages
  end
  mount ActionCable.server => "/cable"
end
