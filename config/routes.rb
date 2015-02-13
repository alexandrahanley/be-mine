Rails.application.routes.draw do
 root "about#index"
  resources :users do
    resources :messages
  end

get 'about' => 'about#index'
get '/sign-up' => 'registrations#new', as: :signup
post '/sign-up' => 'registrations#create'
get 'sign-in' => 'authentication#new', as: :signin
post '/sign-in' => 'authentication#create'
get '/sign-out' => 'authentication#destroy', as: :signout



end
