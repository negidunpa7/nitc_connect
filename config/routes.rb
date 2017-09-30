Rails.application.routes.draw do

  root 'sessions#new'
  get 'sessions/new'
  get '/nitcconnect', to: 'sessions#new'
  get 'profile/show'
  get '/show', to: 'profile#show'

  get 'logout' => 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post 'posts/create'
  get 'posts/index'
  post 'posts/addtags'
  post 'users/addtags'
  post 'users/noti'
  post 'users/showuser'
  post 'users/search'
   post 'posts/removeupvote'
  post 'posts/flagpost'
    post 'posts/upvote'
  post 'posts/downvote'
   post 'users/connect'
  post 'users/accept'
  get 'admin/show'
  get 'admin/verify'
  get 'admin/event'
  get 'admin/tag'
  post 'admin/addtags'
  get 'admin/news'
  post 'admin/createnews'
  get 'admin/spam'
  post 'admin/verified'
  post 'admin/destroy'
  post 'posts/delete'
  post 'posts/deleteprof'
  get 'profile/showconnect'
  post 'admin/destroyuser'
  post 'admin/show'
  post 'admin/ignore'
  get 'users/edittag'
  post 'users/edittags'
  post 'users/removetag'
  resources :users 
  #resources :tags
  resources:posts do
  resources:comments
  end

 
  	

end
