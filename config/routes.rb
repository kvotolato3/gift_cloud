Rails.application.routes.draw do
  devise_for :users

  root 'user_items#landing_page'

  resources :users, except: [:create, :destroy, :edit, :new, :index, :show, :update] do
    resources :user_items, only: [:new, :create, :index]
  end

  resources :occasions, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
