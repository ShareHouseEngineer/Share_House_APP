Rails.application.routes.draw do

  root 'homes#top'
  devise_for :users
  resources :photos

end
