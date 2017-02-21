Rails.application.routes.draw do
  post "/rate" => "rater#create", as: "rate"
  devise_for :users, controllers: {omniauth_callbacks: "callbacks",
    registrations: "users"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|vi|ja/ do
    root "static_pages#home"
    resources :projects do
      resources :users
    end
    resources :users
    resources :blogs
    resources :news
    resources :likes
    resources :participates
    resources :comments
    resources :contacts
    resources :categories
    resources :like_blogs
    namespace :admin do
      root "static_pages#index", as: "root"
    end
  end
end
