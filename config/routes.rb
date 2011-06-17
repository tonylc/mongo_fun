ClaimAbleCodeChallenge::Application.routes.draw do
  resources :claims do
    resources :notes, :only => [:new, :create, :edit, :update]
  end

  root :to => "claims#index"
end
