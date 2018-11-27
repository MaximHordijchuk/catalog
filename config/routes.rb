Rails.application.routes.draw do
  resources :categories, only: [], param: :category_alias do
    get '/:page', action: :show, on: :member, as: ''
  end
  resources :items, only: :show, param: :alias
end
