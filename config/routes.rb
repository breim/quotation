Rails.application.routes.draw do
 

  resources :invitations

  resources :itens

  resources :quotes, :path => 'cotacoes' do 
    resources :invitations
  end

  resources :categories

  resources :funcionaries

  resources :companies, :path => 'empresas'
  get '/minhas-empresas' => 'companies#usercompanies', as: :user_companies
  get '/painel-de-cotacoes' => 'quotes#painel', as: :cotacoes_painel
  get '/busca/empresas' => 'companies#search', as: :busca_empresas
  get '/convidar/:id/:quote' => 'invitations#send_invite', as: :send_invite
  get '/desconvidar/:id/:quote' => 'invitations#broke_invite', as: :broke_invite
  get '/enviar-cotacao/:quote_id' => 'invitations#send_quotation', as: :send_quotation

  devise_for :users
  resources :system, :path => 'sistema'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'institutional#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
