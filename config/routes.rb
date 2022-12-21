Rails.application.routes.draw do
 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # top.html.erbをトップページに設定
  root to:"homes#top"
  get "home/about" => "homes#about"
  resources :books,only:[:new,:create,:index,:show,:destroy,:edit,:update]
  resources :users,only:[:new,:create,:index,:show,:edit,:update]

end