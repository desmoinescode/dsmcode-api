DsmcodeApi::Application.routes.draw do
  resources :groups
  resource :tweets
  resource :posts
end
