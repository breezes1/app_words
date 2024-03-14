Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  root 'wordbooks#index'

  # 单词本的路由
  resources :wordbooks, only: :index
  namespace :wordbooks, path: 'wordbooks/:word_book_id' do
    resources :words do
      member do
        put 'mastered' # 标记单词为已掌握
        put 'unmastered' # 标记单词为未掌握
      end
    end
  end
end
