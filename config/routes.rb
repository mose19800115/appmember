Rails.application.routes.draw do
#  resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'members', to: 'members#create'
  post 'member/login', to: 'members#login'
  post 'member/show', to: 'members#show'
end
