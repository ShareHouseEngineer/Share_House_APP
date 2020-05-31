Rails.application.routes.draw do

  root 'homes#top'
  devise_for :users

  resources :photos do
    member do
      get 'delete_page'
    end
  end
  
end
