Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/test_views/about'
  get '/test_views/contact'
  get '/test_views/games'
  get '/test_views/news'
  get '/test_views/single'
  get '/test_views/home'
  
  root 'test_views#home'
  
end
