Rails.application.routes.draw do
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  # ログインするためのフォーム
  get   '/login',   to: 'sessions#new'
  
  # 新規メールアドレス、パスワード送信 データをもとにSessionを作成
  post   '/login',   to: 'sessions#create'
  
  # ログアウトでSessionを削除
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :topics
  
  # お気に入り
  get 'favorites/index'
  post 'favorites', to: 'favorites#create'
  
  # お気に入り削除
  delete 'favorites', to: 'favorites#destroy'
  # post 'favorites/:id/destroy', to: 'favorites#destroy'
  
end
