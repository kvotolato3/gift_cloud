Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'user_items#landing_page'

  resources :users, except: [:create, :destroy, :edit, :new, :index, :show, :update] do
    resources :user_items, only: [:new, :create, :index]
    resources :claims, only: [:create]
  end

  resources :occasions, only: [:new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
