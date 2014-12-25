Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  Rails.application.routes.draw do
    devise_for :bloggers, controllers: {
        sessions: 'blogger/sessions',
        registrations: 'blogger/registrations'
    }
  end

  root 'home#index'

  get 'home/index', to: 'home#index'
  get 'home/sample'

  # get list articles
  get 'home/articles/:id', to: 'home#articles', as: 'home_articles'
  # article detail route
  get 'home/article/:id', to: 'home#article', as: 'home_article'
  # search route
  get 'home/search', to: 'home#search', as: 'home_search'
  # article comment
  post 'home/article/:id', to: 'home#article_comment', as: 'article_comment'

  get 'home/videos', to: 'home#tong_hop_video', as: 'home_tong_hop_video'

  get 'home/videos/:id', to: 'home#videos', as: 'home_videos'

  # get 'home/videos', to: 'video#videos', as: 'videos'

  # get list blogs
  get 'home/blogs', to: 'home#blogs', as: 'home_blogs'
  #get blog detail
  get 'home/blog/:id', to: 'home#blog', as: 'home_blog'
  #blog comment
  post 'home/blog/:id', to: 'home#blog_comment', as: 'blog_comment'

  get 'home/blogger/:id', to: 'home#blogger_account', as: 'home_blogger_account'
  get 'home/blogger/:id/upload', to: 'home#blogger_upload_article', as: 'blogger_upload_article'
  get 'home/blogger/:id/upload', to: 'home#blogger_edit_article', as: 'blogger_edit_article'

  get 'home/rss_page', to: 'home#rss_page', as: 'home_rss_page'
  get 'home/category_rss/:id', to: 'home#category_rss', as: 'home_category_rss'
  get 'home/blog_rss',  to: 'home#blog_rss', as: 'home_blog_rss'

  # front-end route
  post 'admin/articles/:id', to: 'admin/articles#status', as: 'admin_articles_update_status'
  post 'admin/videos/:id', to: 'admin/videos#status', as: 'admin_videos_update_status'
  post 'admin/comments/:id', to: 'admin/comments#status', as: 'admin_comments_update_status'
  post 'admin/blogs/:id', to: 'admin/blogs#status', as: 'admin_blogs_update_status'
  post 'admin/bloggers/:id', to: 'admin/bloggers#status', as: 'admin_bloggers_update_status'

  # resources :articles do
  #   resources :comments
  # end

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
end
