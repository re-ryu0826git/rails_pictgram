Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#index'
  get 'pages/help'
  
  resources :users
  
  # ログインするためのフォーム
  get   '/login',   to: 'sessions#new'
  
  # 新規メールアドレス、パスワード送信 データをもとにSessionを作成
  post   '/login',   to: 'sessions#create'
  
  # ログアウトでSessionを削除
  delete '/logout',  to: 'sessions#destroy'
end
