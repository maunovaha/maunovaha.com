Rails.application.routes.draw do
  
  # Index
  root 'home#index'

  # Blog
  get  'blog',                          to: 'blog#index'

  # Blog posts
  get  'blog/:year/:month/:day/:title', to: 'post#show'

  # Tags

  # Subscribing
  post 'subscribers',                   to: 'subscribers#create'
  get  'subscribers/success',           to: 'subscribers#success'
  get  'subscribers/:id',               to: 'subscribers#activate'
  get  'subscribers/:id/cancellation',  to: 'subscribers#cancel'
end