ClaimAbleCodeChallenge::Application.routes.draw do
  resources :claims do
    resources :customers, :only => [:new, :create, :edit, :update]
    resources :notes, :only => [:new, :create, :edit, :update]
  end

  root :to => "claims#index"
end
