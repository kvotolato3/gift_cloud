Rails.application.routes.draw do
  root 'user_item#landing_page'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
