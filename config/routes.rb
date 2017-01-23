Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "callbacks",
    registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    resources :projects do
      resources :comments
    end
    resources :users

    resources :blogs
    resources :participates
    resources :likes
    resources :hots
  end
end
