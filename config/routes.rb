Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'groups/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'groups/index'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'groups/show'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'groups/edit'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'groups/destroy'
    end
  end

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
      post 'users/show'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'users/new'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'users/create'
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


  namespace :api do
    namespace :v1 do
      post 'sessions/create'
      get 'sessions/destroy'

      resources :admins
    end
  end


  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
