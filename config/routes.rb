Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
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
    resources :posts
    namespace :admin do
      root "static_pages#index", as: "root"
    end
    resources :messages
  end

  mount ActionCable.server => "/cable"
end
