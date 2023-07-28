Rails.application.routes.draw do
  root 'articles#index'

  get '/article' , to: 'articles#index'
end
