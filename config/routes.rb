Rails.application.routes.draw do
  # Home
  root 'home#index'

  # Subscribing
  post 'subscribers',                  to: 'subscribers#create'
  get  'subscribers/success',          to: 'subscribers#success'
  get  'subscribers/:id',              to: 'subscribers#activate'
  get  'subscribers/:id/cancellation', to: 'subscribers#cancel'

  namespace :blog do
    # Posts
    root                               to: 'posts#index'
    get ':year/:month/:day/:title',    to: 'posts#show'

    # Tags
    get 'tags',                        to: 'tags#index'
  end
end