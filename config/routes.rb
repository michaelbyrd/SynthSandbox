Rails.application.routes.draw do
  resources 'sounds'
  root 'sounds#index'
  devise_for :users
end
