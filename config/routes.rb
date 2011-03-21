Rubyists::Application.routes.draw do
  
  %w{about faq page_404 under_construction}.each do |url|
    match url => "pages##{url}"
  end
  
  devise_for :companies
  devise_for :users

  resources :authentications

  resources :companies, :only => [:index, :show]
  resources :users
  
  root :to => 'users#index'
end