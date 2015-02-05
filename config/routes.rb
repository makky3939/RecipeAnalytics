Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

  root 'setting#status'
  get 'settings' => 'setting#status'

  resources :analyse, :only => [:index]

  namespace :analyse do
    get 'method/of_ingredients' => 'method#of_ingredients'
    get 'method/of_ingredients_create' => 'method#of_ingredients_create'
    get 'method/of_ingredients_json' => 'method#of_ingredients_json'
    get 'method/of_ingredients_csv' => 'method#of_ingredients_csv'

    get 'report/user_relation' => 'report#user_relation'
    get 'report/user_relation_create' => 'report#user_relation_create'
    get 'report/user_relation_json' => 'report#user_relation_json'
    get 'report/user_relation_csv' => 'report#user_relation_csv'

    get 'recipe/name' => 'recipe#name'
    get 'recipe/name_create' => 'recipe#name_create'
    get 'recipe/name_json' => 'recipe#name_json'
    get 'recipe/name_csv' => 'recipe#name_csv'
  end

  get 'ingredients/with_frequency' => 'ingredients#with_frequency'
  get 'ingredients/with_frequency_json' => 'ingredients#with_frequency_json'

  get 'recipes/with_frequency' => 'recipes#with_frequency'
  get 'recipes/with_frequency_json' => 'recipes#with_frequency_json'
  get 'recipes/post_calendar' => 'recipes#post_calendar'
  get 'recipes/post_calendar_json' => 'recipes#post_calendar_json'

  get 'list/recipe' => 'list#recipe'
  get 'list/recipe/:id' => 'list#recipe_detail'
  get 'list/step' => 'list#step' 
  get 'list/step/:id' => 'list#step_detail'
  get 'list/report' => 'list#report'
  get 'list/report/:id' => 'list#report_detail'
  get 'list/ingredient' => 'list#ingredient'
  get 'list/ingredient/:id' => 'list#ingredient_detail'
end
