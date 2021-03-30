Rails.application.routes.draw do

  get 'sections/index'
  get 'sections/show'
  get 'sections/new'
  get 'sections/edit'
  get 'sections/delete'

  resources :subjects do
    member do
      get :delete
    end
  end
  


  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end


  resources :posts
  get 'subject/page'
  get 'subject/section'
  root 'demo#index'

  
  get 'demo/index' 
  get 'demo/hello' 
  get 'demo/other_hello' 
  get 'demo/lynda' 
  get 'demo/escape_output' 
  
  





  # default route
  # may go away in future versions of Rails
  # get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
