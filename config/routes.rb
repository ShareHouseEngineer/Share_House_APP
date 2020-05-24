Rails.application.routes.draw do

  root 'homes#top'
  devise_for :users
   # devise_for :users, controllers: {
   # sessions: 'users/sessions',
   # registrations: 'users/registrations'
   # }
# devise_for:uers　  はresourcesと同じような機能
# devise_for :users, controllers:   はonlyと同じような機能
# devise_forではpasswordとかの、ルーティングいらないコントローラーのルーティングも作られるので
# ルーティングが必要なコントローラーだけを記述して指定する

 	# devise_scope :users do
 		# get 'sign_out', to: "sessions#destroy"
    # end
#namesperce  ディレの階層が変わって　　urlも変わる(URLは同じものがあってはいけないのでadmin/userで使い分けるときに使う)
#scpoe　　ディレの階層が変わったことをPCに伝えてるだけ　　urlは変わらない

  resources :photoes
  # resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
