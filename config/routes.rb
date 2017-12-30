Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'sessions/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'sessions/destroy'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'users/index'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'users/show'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'users/new'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'users/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'users/update'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'users/edit'
    end
  end

  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
