# config/routes/api/v1.rb
Foreman::Application.routes.draw do

  namespace :api, :defaults => {:format => 'json'} do
    scope :module => :v1, :constraints => ApiConstraints.new(:version => 1, :default => true) do
      resources :bookmarks, :except => [:new, :edit]
      resources :architectures, :except => [:new, :edit]
      resources :users, :except => [:new, :edit]
      resources :operatingsystems, :except => [:new, :edit] do
        member do
          get 'bootfiles'
        end
      end

      match '/', :to => 'home#index'
      match 'status', :to => 'home#status', :as => "status"
      match '*other', :to => 'home#route_error'
    end
#
  end

end
