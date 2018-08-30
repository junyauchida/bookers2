Rails.application.routes.draw do
  resources :books
  devise_for :users

  resources :users, except: [:create]
  # resourcesでcreate以外を取得する

  get 'top' => 'root#top'
  # 「ルートパス」　'top'というurlにアクセスした時、rootコントローラのtopアクションが呼び出される

  get 'about' => 'root#about'

  root 'root#top'
  # ???




end
