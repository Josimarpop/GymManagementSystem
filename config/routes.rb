Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        get 'membership_types/index'
        post 'membership_types/show'
        post 'membership_types/edit'
        post 'membership_types/destroy'
        post 'membership_types/update'
        post 'membership_types/create'
      end
    end


  namespace :api do
    namespace :v1 do
      post 'mails/create'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'user_groups/index'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'user_groups/show'
      post 'user_groups/create'
      post 'user_groups/destroy'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'groups/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'groups/index'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'groups/show'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'groups/edit'
      post 'groups/update'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'groups/destroy'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'sessions/create'
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
      post 'users/update'
      post 'users/destroy'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'users/edit'
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
