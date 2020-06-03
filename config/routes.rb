Rails.application.routes.draw do

  root 'photos#index'
  devise_for :users

  resources :photos, only:[:show, :new, :create, :destroy, :update, :edit] do
    member do
      get 'delete_page'
    end
  end
  
end

