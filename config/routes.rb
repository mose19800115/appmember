Rails.application.routes.draw do
  resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'login', to: 'members#login'
end
