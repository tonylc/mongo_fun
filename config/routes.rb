ClaimAbleCodeChallenge::Application.routes.draw do
  resources :claims do
    resources :customers, :only => [:new, :create, :edit, :update, :show]
    resources :notes, :only => [:new, :create, :edit, :update, :show]
  end

  root :to => "claims#index"
end
