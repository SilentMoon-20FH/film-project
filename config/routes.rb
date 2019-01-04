Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :lists
  devise_for :users
  get 'login/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/test_views/about'
  get '/test_views/contact'
  get '/test_views/games'
  get '/test_views/news'
  get '/test_views/newsfind'
  get '/test_views/single'
  get '/test_views/home'
  get '/test_views/aboutme'
  get '/test_views/aboutmefollowpage'
  get '/test_views/aboutmefanpage'
  get '/test_views/aboutother'
  get '/test_views/showpic'
  get '/test_views/deletecomment'
  post '/test_views/showpic'
  post '/test_views/writecomment'
  post '/test_views/followfunc'
  post '/test_views/unfollowfunc'
  post '/test_views/uploadpic'
  post '/test_views/find_in_single'
  
  #模版首页
  root 'test_views#home'
  
  #使用deivse生成的登录界面首页(把网页教程中的home改名为login，避免和test_views的home动作重名)
  #root to: "login#index"
  
end
