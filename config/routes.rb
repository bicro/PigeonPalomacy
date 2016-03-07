Rails.application.routes.draw do
  root 'submissions#new'
  resources :submissions
  resources :questions
end
