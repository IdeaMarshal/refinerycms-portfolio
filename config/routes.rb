::Refinery::Application.routes.draw do
  resources :portfolios, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :portfolios, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
