RedditClone::Application.routes.draw do
  resources :users, :only => [:new, :create, :show]
  resource :session, :only => [:new, :create, :destroy]
  resources :subs
  resources :links, :only => [:new, :create, :show, :edit, :update] do
    resources :comments, :only => [:new, :create]
  end
end
