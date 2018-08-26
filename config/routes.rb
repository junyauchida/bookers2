Rails.application.routes.draw do
  resources :books
  devise_for :users

  resources :users, except: [:create]
  # resourcesでcreate以外を取得する

  get '' => 'root#top'
  # 「ルートパス」　/topというurlにアクセスした時、rootコントローラのtopアクションが呼び出される
  #  なんで’’？





end
