Rails.application.routes.draw do
  # get 'users/index'
  root 'users#login'
  get 'users/register'
  post 'users/register'
  get 'users/login'
  get 'users/index'
  post 'users/login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
