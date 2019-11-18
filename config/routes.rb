Rails.application.routes.draw do
  get 'auth/new'
  get 'auth/create'
  get 'auth/login'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
